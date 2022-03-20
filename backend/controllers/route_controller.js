const {Router } = require('express')
const router = Router();
const jwt = require('jsonwebtoken')
const config = require('../config')
const bcrypt = require('bcryptjs')


router.get('/', (req, res) => {
    res.send("Hey")
})

module.exports = router;

