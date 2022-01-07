import React from 'react'
import {Stack, Button} from "@mui/material";


export default function CategoryList(categories) {
    function handleClick() {
    //TODO
    }

    return (
        <Stack>
            {categories.map ( category => (
                <Button variant="text" onClick={handleClick}>{category.CategoryName} </Button>
            ) )}
        </Stack>
    )
}


