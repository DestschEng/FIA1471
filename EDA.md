# Capture price changes on [Tiki](https://tiki.vn/) and [Shopee](https://shopee.vn/) retail website application with Github Workflow.

## Code to Check Schema
```python
type(result['responseBody']) == str
X = json.loads(result['responseBody'])
X['data'].keys()
```

### Keys of the data Attribute
```
dict_keys(['item', 'account', 'product_images', 'product_price', 'flash_sale', 'flash_sale_preview', 'deep_discount', 'exclusive_price', 'exclusive_price_cta', 'product_meta', 'product_review', 'promotion_info', 'age_gate', 'shipping_meta', 'product_shipping', 'shop_vouchers', 'free_return', 'coin_info', 'product_attributes', 'shop_detailed', 'age_gate_control', 'abnormal_popup', 'return_on_spot', 'display_sections', 'ineligible_ep', 'tax_disclaimer', 'alcohol_disclaimer', 'design_control', 'shopee_free_return', 'detail_level', 'removed_fields', 'size_guide', 'designer_info', 'shipping_info', 'vehicle_compatibility_info', 'nea', 'button_group', 'installment_drawer', 'ongoing_banner', 'teaser_banner', 'price_breakdown', 'membership_exclusive', 'membership_exclusive_teaser'])
```
