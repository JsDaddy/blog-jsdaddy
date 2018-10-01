title: CSS Grid Layout short instruction
tags:
  - css
categories: []
date: 2018-09-26 15:17:00
---
One of the most significant events last year was that main browser received official support CSS Grid Layout.
Every day CSS Grid Layout becomes more and more popular among developers. We have prepared basic instruction about this instrument.

![support CSS Grid Layout](https://cssgrid.cc/images/medium/grid-browser-support.png)

## Grid containers

---
    Creates block grid container
    
```css
.container {
  display: grid;
}
```
---
    Creates inline grid container
   
```css
.container {
  display: inline-grid;
}
```

---
Another property that is not often used - subgrid if you want to apply column parent size for child container.


## Grid grid-template-rows and grid-template-columns

This property define size row and colums grid. Values of this properties are typed with space.

```html
<div class="container">
    <div class="cell">
        1
    </div>
    <div class="cell">
        2
    </div>
    <div class="cell">
        3
    </div>
    <div class="cell">
        4
    </div>
</div>
```
    
```css
.container {
  display: grid;
  grid-template-columns: 200px 200px;
  grid-template-rows: 200px 200px;
}
.cell {
    border: 1px solid #ccc;
    background: #3b5998;
}
```

![We created 2 rows and 2 columns](/blog/css/images/column-row-grid.png)

## Unit of measurement fr

In specification was created new unit of measurement - fr;

    
```css
.container {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: 200px 200px;
}
.cell {
    border: 1px solid #ccc;
    background: #3b5998;
}
```

![We created 2 rows and 2 columns width new unit of measurement](/blog/css/images/column-row-grid.png)

## Creates track listings with repeat() notation
    
Large templates can contain large number of columns and row. You can use function repeat() to not repeat values.

```css
.container {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-template-rows: 200px 200px;
}
.cell {
    border: 1px solid #ccc;
    background: #3b5998;
}
```

![We created 2 rows and 2 columns use repeat() function](/blog/css/images/column-row-grid.png)

You can apply function ( repeat() ) for  grid-template-rows property. Working principles is not going to change.

## Use function minmax()

Grid gives us the opportunity flexibly specify the sizes of containers by using function minmax(). You can give min and max value inside function: 
For example you need to create container with min height 200px but max height have to be flexibly. You can write this in the following way:
 
```css
 .container {
   display: grid;
   grid-template-columns: repeat(2, 1fr);
   grid-auto-rows: minmax(200px, auto);
 }
```

![Manage is quite convenient](/blog/css/images/column-row-grid1.png)


## Gutters 
This is one of the comfortable ways to specify gap between blocks of grid container 
```css
 .container {
   display: grid;
   grid-template-columns: repeat(2, 1fr);
   grid-auto-rows: minmax(200px, auto);
   column-gap: 15px;
   row-gap: 5px;
 }
```
![Work result](/blog/css/images/column-row-grid2.png)