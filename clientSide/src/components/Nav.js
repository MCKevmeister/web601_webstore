import * as React from 'react';
import Button from '@mui/material/Button';
import Grid from "@mui/material/Grid";
import {Box} from "@mui/material";

export default function Navigation() {
    return (
        <Box sx={{ flexGrow: 1, background: "lightgrey"}} >
            <Grid container spacing={2} >
                <Grid item xs={4}>
                    <Button variant="contained" href="/">
                    Home
                    </Button>
                </Grid>
                <Grid item xs={4}>
                    <Button variant="contained" href="/cart">
                        Cart
                    </Button>
                </Grid>
                <Grid item xs={4}>
                    <Button variant="contained" href="/signin">
                        Account
                    </Button>
                </Grid>
            </Grid>
        </Box>
    );
}
