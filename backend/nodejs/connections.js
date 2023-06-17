const mongoose = require('mongoose');
const dbURL = 'mongodb+srv://haidermubeendoctornow:haidermubeendoctornow@doctornow.njbjumi.mongodb.net/pharmacy';
 
mongoose.connect(dbURL, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
  .then(() => {
    console.log('Connected to MongoDB');
  })
  .catch((error) => {
    console.error('Error connecting to MongoDB:', error);
  });