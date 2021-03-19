module.exports = {
  friendlyName: 'Welcome user',
  description: 'Look up the specified user and welcome them, or redirect to a signup page if no user was found.',
  inputs: {},
  exits: {
    success: {
      responseType: 'view',
      viewTemplatePath: 'pages/homepage'
    }
  },

  fn: async function () {
    // just sample code to hit database and enforce connection is set
    const ds = await sails.getDatastore('default');
    await ds.sendNativeQuery("SELECT 1")

    return {};
  }
};