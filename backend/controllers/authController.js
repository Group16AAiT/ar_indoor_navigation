const { Router } = require('express')
const router = Router();
const User = require('../models/userModel')
const verifyToken = require('./verifyToken')
const jwt = require('jsonwebtoken')
const config = require('../config')
const bcrypt = require('bcryptjs')


// Signup router
router.post('/signup', async (req, res) => {
    try {
        const { name, email, password } = req.body;
        const user = new User({
            name,
            email,
            password
        });
        const salt = await bcrypt.genSalt(10);
        user.password = await bcrypt.hash(user.password, salt);
        await user.save();
        const token = jwt.sign({ id: user.id }, config.secret, {
            expiresIn: '24h'
        });
        res.status(200).json({ auth: true, token });
    }
    catch (e) {
        console.log(e)
        res.status(500).send("Please try again");

    }
});


// Login router
router.post('/login', async (req, res) => {
    try {
        const user = await User.findOne({ email: req.body.email })
        if (!user) {
            return res.status(404).send("User does not exist");
        }
        const validPassword = await bcrypt.compare(req.body.password, user.password);
        if (!validPassword) {
            return res.status(401).send({ auth: false, token })
        } else {
            const token = jwt.sign({ id: user._id }, config.secret, {
                expiresIn: '24h'
            });
            res.status(200).json({ auth: true, token });

        }
    } catch (e) {
        console.log(e)
        res.status(500).send('Plese try again , "Can not Login"');
    }

});

// Logout router

router.get('/logout', function (req, res) {
    res.status(200).send({ auth: false, token: null });

});



module.exports = router;