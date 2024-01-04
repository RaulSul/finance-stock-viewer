# finance-stock-viewer

## The changes implemented:
* change of architecture from MVC to MVVM
* moving some of the code of `StockListViewController` to extensions, to simplify maintainability of the code
* refactoring of the nested `for` loop, when iterating through the `array` of `stocks` and change to the use of `dictionary` of prices in order to reduce time complexity of ``O(n^2)``  to `O(n)`
* switching `Stock` from `class` to `struct` 
* addition of the Unit Tests for the new `StockListViewModel` class and for `StockPriceUpdateService`
* minor code refactoring of other parts of the project
