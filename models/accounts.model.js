module.exports = (sequelize, Sequelize) => {
    const Account = sequelize.define('accounts', {
        user_id: {type: Sequelize.STRING},
        fio:{type: Sequelize.STRING},
        phone:{type: Sequelize.STRING},
        file_name:{type: Sequelize.STRING},
        status:{type: Sequelize.STRING},
    });
    return Account;
}