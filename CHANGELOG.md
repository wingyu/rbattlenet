## [2.0.0] - 2019-12-18
- Added all Blizzard Game Data and Profile API endpoints.
- Added REAL_CONNECTION option to conditionally run tests with real API connections.

### Breaking changes
- Removed access to all existing (Community API) endpoints.
- Method `set_region` has been removed. To change the region or locale use `set_options` instead.
- Responses will now be returned as a `RBattlenet::Result` or `RBattlenet::ResultCollection` object. Collection objects (containing Result objects) are returned when an Array of input is provided, whereas singular input will return a Result object. You can opt out of this behaviour and get raw HTTP responses back by setting the new `raw_response` option like so: `RBattlenet.set_options(raw_response: true)`
