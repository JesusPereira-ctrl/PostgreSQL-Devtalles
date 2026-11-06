# Terminology and Structure

## Terminology

- DBA: Database Administrator
- DDL: Data Definition Language, Example create, alter, drop, truncate
- DML: Data Manipulation Language, Example insert, delete, update
- TCL: Transaction Control Language, Example commit, rollback
- DQL: Data Query Language, Example select

## Aggregate Functions

- Count
- Sum
- Max
- Min
- Group By
- Having
- Order By

## Filtering Data

- Like
- In
- Is Null
- Is Not Null
- Where
- And
- Or
- Between

## General Structure of a Select

```sql
    select * | distinct, field, alias, functions
    where condition, conditions, and, or, in, like
joins
    group by grouping field, all
    having condition
    order by expression, asc, desc
    limit value, all
    offset starting point
```
