const DMED = artifacts.require("DMED");
const Proxy = artifacts.require("Proxy");
module.exports = async function (deployer, network, accounts) {
  const dmed = await DMED.new();
  const proxy = await Proxy.new(dmed.address);
  var proxyDMED = await DMED.at(proxy.address);
  await proxyDMED.setAlternativeMedicineTypes("Chelation, Stem Cell Therapy, Reiki, Seimi, Acupuncture, Chiropractor, Ayurveda, Nutrition, Electromagnetic Therapy, Massage, Yoga");
  var altTypes = await proxyDMED.getAlternativeMedicineTypes();
  console.log(altTypes.toString());
  const updatedDMED = await UpdatedDMED.new();
  proxy.upgrade(updatedDMED.address);
  altTypes = await proxyDMED.getAlternativeMedicineTypes();
  console.log(altTypes.toString());
  //Deploy New Version
  const UpdatedDMED = await UpdatedDMED.new();
  proxy.upgrade(UpdatedDMED.address);
  proxyDMED = await UpdatedDMED.at(proxy.address);
  proxyDMED.initialize(accounts[0]);
  altTypes = await proxyDMED.getAlternativeMedicineTypes();
  console.log(altTypes.toString());
  await proxyDMED.getAlternativeMedicineTypes("Chelation, Stem Cell Therapy, Reiki, Seimi, Acupuncture, Electromagnetic Therapy, Ayurveda, Nutrition, Chiropractor, Reflexive Therapy, Ozone Therapy");








}

