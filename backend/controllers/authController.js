const { Router } = require('express')
const router = Router();
const User = require('../models/userModel')
// const verifyToken = require('./verifyToken')
const jwt = require('jsonwebtoken')
const config = require('../config')
const bcrypt = require('bcryptjs')
authMiddleware = require('../middlewares/auth');


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

// Change password
router.post('/change-password', authMiddleware.isAuthenticated, async (req, res) => {
    try {
        const user = await User.findOne({ _id: req.userId })
        console.log({user});

        if (!user) {
            return res.status(404).json({
                status: 'error',
                code: 404,
                message: "User does not exist"
            });
        }
        if(req.body.oldPassword == null) {
            return res.status(400).json({
                status: 'error',
                code: 400,
                message: "old password not provided"
            });
        }
        if(req.body.newPassword == null) {
            return res.status(400).json({
                status: 'error',
                code: 400,
                message: "New password not provided"
            });
        }
        const validOldPassword = await bcrypt.compare(req.body.oldPassword, user.password);
        if (!validOldPassword) {
            return res.status(401).json({
                status: 'error',
                code: 401,
                message: "Invalid old password"
            });
        }
        const salt = await bcrypt.genSalt(10);
        user.password = await bcrypt.hash(req.body.newPassword, salt);
        await user.save();
        res.status(200).json({
            status: 'success',
            code: 200,
            message: "Password successfully changed"
        });
    } catch (e) {
        console.log(e)
        res.status(500).json({
            status: 'error',
            code: 500,
            message: "Unknown error"
        });
    }
});


module.exports = router;