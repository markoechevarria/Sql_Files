"use strict"

function requestHandlerWithCallbacks(req, res) {
    User.findById(req.userId, function (err, user) {
        if (err) {
            res.send(err);
        } else {
            Tasks.findById(user.taskId, function (err, tasks) {
                if (err) {
                    return res.send(err);
                } else {
                    tasks.completed = true;
                    tasks.save(function (err) {
                        if (err) {
                            return res.send(err)
                        } else {
                            res.send("Task completed");
                        }
                    })
                }
            })
        }
    })
}

function requestHandlerWithPromises(req, res) {
    User.findById(req.userId)
        .then(function (user) {
            return Tasks.findById(user.taskId);
        })
        .then(function(tasks) {
            tasks.completed = true;
            return tasks.save();
        })
        .then(function() {
            res.send("Tasks completed");
        })
        .catch( function (errors) {
            res.send(errors)
        }) 
}

async function requestHandlerWithAsyncAwait(req, res) {
    try {
        const user = await User.findById(req.userId);
        const tasks = await tasks.findById(user.tasksId);
        tasks.completed = true;
        await tasks.save();
        res.send("Task completed");
    } catch (error) {
        res.send(e);
    }
}
 
// Parallel and Sequential

const util = requiere('util');
const sleep = util.promisify(setTimeout);

async taskOne() {
    try {
        await sleep(4000);
        return "One value";
    } catch (error) {
        return error
    }
}

async taskTwo() {
    try {
        await sleep(2000);
        return "Two value";
    } catch (error) {
        return error
    }
}

// Sequential code

async function main() {

    try {
        console.time("Measuring time")
        const valueOne = taskOne();
        const valueTwo = taskTwo();
        console.timeEnd("Measuring time")

        console.log("Task one returned", valueOne)
        console.log("Task two returned", valueTwo)
    } catch (error) {
        console.log(error)
    }

}

// Parallel code

async function main() {

    try {
        console.time("Measuring time")
        const results = await Promise.all([taskOne(), taskTwo()])
        console.timeEnd("Measuring time")

        console.log("Task one returned", results[0])
        console.log("Task two returned", results[1])
    } catch (error) {
        console.log(error)
    }

}

main();
