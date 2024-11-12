import subprocess
import json
import sys
from datetime import datetime
import pandas as pd

def run_yahoo_crawler(symbol):
    """
    Run the shell script crawler with the given stock symbol
    """
    try:
        # Run the shell script with the symbol as argument
        result = subprocess.run(
            ['bash', 'yahoo_crawler.sh', symbol],
            capture_output=True,
            text=True,
            check=True
        )
        
        # Get the output filename from the shell script
        output_file = result.stdout.strip()
        
        if output_file == "ERROR" or "ERROR:" in output_file:
            print(f"Error occurred while downloading data: {result.stderr}")
            return None
            
        # Read and process the downloaded data
        with open(output_file, 'r') as f:
            data = json.load(f)
            return process_yahoo_data(data, symbol)
            
    except subprocess.CalledProcessError as e:
        print(f"Error running shell script: {e}")
        return None
    except json.JSONDecodeError as e:
        print(f"Error parsing JSON data: {e}")
        return None
    except Exception as e:
        print(f"Unexpected error: {e}")
        return None

def process_yahoo_data(data, symbol):
    """
    Process Yahoo Finance JSON data into a pandas DataFrame
    """
    try:
        # Navigate through the JSON structure
        symbol_data = None
        for result in data['spark']['result']:
            if result['symbol'] == symbol:
                symbol_data = result['response'][0]
                break
                
        if not symbol_data:
            print(f"No data found for symbol {symbol}")
            return None
            
        # Extract metadata
        meta = symbol_data['meta']
        timestamps = symbol_data['timestamp']
        quotes = symbol_data['indicators']['quote'][0]
        
        # Create DataFrame
        df = pd.DataFrame({
            'timestamp': [datetime.fromtimestamp(ts) for ts in timestamps],
            'close': quotes['close'],
            'symbol': symbol
        })
        
        # Add metadata as attributes
        df.attrs['currency'] = meta['currency']
        df.attrs['exchange'] = meta['exchangeName']
        df.attrs['instrument_type'] = meta['instrumentType']
        df.attrs['trading_day'] = {
            'high': meta['regularMarketDayHigh'],
            'low': meta['regularMarketDayLow'],
            'volume': meta['regularMarketVolume'],
            'previous_close': meta['previousClose']
        }
        
        return df
        
    except KeyError as e:
        print(f"Error processing data structure: {e}")
        return None

def main():
    if len(sys.argv) < 2:
        print("Please provide a stock symbol, e.g., AAPL")
        return
        
    symbol = sys.argv[1]
    print(f"Starting data download for {symbol}")
    
    df = run_yahoo_crawler(symbol)
    
    if df is not None:
        print("\nData downloaded and processed successfully!")
        print(f"\nTrading info for {symbol}:")
        print(f"Exchange: {df.attrs['exchange']}")
        print(f"Currency: {df.attrs['currency']}")
        print(f"Day High: {df.attrs['trading_day']['high']}")
        print(f"Day Low: {df.attrs['trading_day']['low']}")
        print(f"Volume: {df.attrs['trading_day']['volume']:,}")
        print(f"Previous Close: {df.attrs['trading_day']['previous_close']}")
        
        print("\nPrice data:")
        print(df.head())
        
        # Save to CSV
        csv_filename = f"yahoo_finance_data/{symbol}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.csv"
        df.to_csv(csv_filename, index=False)
        print(f"\nData saved to {csv_filename}")
    else:
        print("Failed to download or process data")

if __name__ == "__main__":
    main()