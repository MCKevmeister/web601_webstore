import AccountCircleSharpIcon from '@mui/icons-material/AccountCircleSharp';
import {createTheme, ThemeProvider} from '@mui/material/styles';
import {Avatar, Box, Button, Container, CssBaseline, TextField, Typography} from "@mui/material";
import Link from "@mui/material/Link";
import Grid from "@mui/material/Grid";


const theme = createTheme ();

export default function SignUp() {
    const handleSubmit = (event) => {
        event.preventDefault ();
        const data = new FormData ( event.currentTarget );
        // call the API to create an account
        console.log ( {
            email: data.get ( 'email' ),
            password: data.get ( 'password' ),
            firstName: data.get ( 'firstname' ),
            lastName: data.get ( 'lastName' ),
        } );
    };

    return (
        <ThemeProvider theme={theme}>
            <Container component={"main"} maxWidth={"xs"}>
                <CssBaseline/>
                <Box sx={{
                    marginTop: 8,
                    display: 'flex',
                    flexDirection: 'column',
                    alignItems: 'center',
                }}
                >
                    <Avatar sx={{m: 1, bgcolor: 'secondary.main'}}>
                        <AccountCircleSharpIcon/>
                    </Avatar>
                    <Typography component={"h1"} variant={"h5"}>
                        Create Account
                    </Typography>
                    <Box component="form" onSubmit={handleSubmit} noValidate sx={{mt: 1}}>
                        <TextField
                            margin="normal"
                            required
                            fullWidth
                            id="email"
                            label="Email Address"
                            name="email"
                            autoComplete="email"
                            autoFocus
                        />
                        <TextField
                            margin="normal"
                            required
                            fullWidth
                            name="password"
                            label="Password"
                            type="password"
                            id="password"
                        />
                        <TextField
                            margin="normal"
                            fullWidth
                            required
                            name="FirstName"
                            label="First Name"
                            type="string">
                        </TextField>
                        <TextField
                            margin="normal"
                            required
                            fullWidth
                            name="LastName"
                            label="Last Name"
                            type="string">
                        </TextField>
                        <Button
                            type="submit"
                            fullWidth
                            variant="contained"
                            sx={{mt: 3, mb: 2}}

                        >
                            Create Account
                        </Button>
                        <Grid container>
                            <Grid item>
                                <Link href="/signin" variant="body2">
                                    {"Already have an account? Sign In"}
                                </Link>
                            </Grid>
                        </Grid>
                    </Box>
                </Box>
            </Container>
        </ThemeProvider>
    )
}

