// /**
//  * Sample responder to `/hello` route :)
//  */
// const logger = require('../../logger/logger')

// /**
//  * Returns a sample message
//  * @param {*} req - request object
//  * @param {*} res - response object
//  */
// const sayHello = (req, res) => {
//     logger.info(`Checker route! Saying hello from ${req.originalUrl}`)
//     res.status(200).json({ "message": "Hello sathya! I am ready for work 08-21-2023!!!@@@" })
// }

// module.exports = {
//     sayHello
// }

const logger = require('../../logger/logger');

/**
 * Returns a sample message with the current date
 * @param {*} req - request object
 * @param {*} res - response object
 */
const sayHello = (req, res) => {
    const currentDate = new Date().toLocaleString(); // Get the current date and time in a readable format
    const message = `Hello Vamsi! I am ready to hack 🎭 Happy hacking! 🎭 on ${currentDate}`;
    logger.info(`Checker route! Saying hello from ${req.originalUrl}`);

    res.status(200).json({ "message": message });
};

module.exports = {
    sayHello
};

/// 203***

// 12052023*****34334