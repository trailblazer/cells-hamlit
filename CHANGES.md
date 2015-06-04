# 0.0.6



# 0.0.5

* Remove Haml's buggy `#form_for` version until Haml 4.1 is out, which fixes this by simply not overriding the helper at all. Include `Cell::Haml` after including the form helpers.

# 0.0.4

* Added `capture` helper to override Rails escaping.