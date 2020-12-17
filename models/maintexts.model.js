module.exports = (sequelize, Sequelize) => {
    const Maintext = sequelize.define('maintexts', {
        name: {type: Sequelize.STRING},
        body:{type: Sequelize.TEXT},
        url:{type: Sequelize.STRING},
        lang:{type: Sequelize.STRING},
        showhide:{type: Sequelize.STRING},
        putdate:{type: Sequelize.STRING}
    });
    return Maintext;
}