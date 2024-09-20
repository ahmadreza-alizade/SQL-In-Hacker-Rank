select n,
    case 
        when p is null then 'Root'
        when n in (select p from BST) then 'Inner'
        else 'Leaf' end as type
    from BST
    order by n ASC
