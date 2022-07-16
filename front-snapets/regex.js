
const hasLetter = new RegExp(/[a-zA-ZçÇáÁàÀãÃâÂäÄéÉèÈêÊëËíÍìÌîÎïÏóÓòÒõÕôÔöÖúÚùÙûÛüÜ\u0300-\u036f]/g);
const hasCharSpecial = new RegExp(/['"!@#$%¨¬&*()\-+=´`/[/\]/{}/_:;?/\\ºª§°]/g);
const hasCharSpecialToPhone = new RegExp(/['"!@#$%¨¬&*=´`/[/\]/{}/_:;?/\\ºª§°]/g);
const hasCharSpecialToEmail = new RegExp(/['"!#$%¨¬&*()+=´`/[/\]/{}:;?/\\ºª§°]/g);
const hasAccent = new RegExp(/[çÇáÁàÀãÃâÂäÄéÉèÈêÊëËíÍìÌîÎïÏóÓòÒõÕôÔöÖúÚùÙûÛüÜ´`^~\u0300-\u036f]/g);
const hasNumber = new RegExp(/[0-9]/g);

const onlyLetter = new RegExp(/[^a-zA-ZçÇáÁàÀãÃâÂäÄéÉèÈêÊëËíÍìÌîÎïÏóÓòÒõÕôÔöÖúÚùÙûÛüÜ\u0300-\u036f ]/g);
const onlyNumber = new RegExp(/[^0-9]/g);

const isFormatCPF = new RegExp(/^\d{3}\.\d{3}\.\d{3}\-\d{2}$/g);
const isFormatCnpj = new RegExp(/^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$/g);
const isFormatDocument = new RegExp(/(^\d{3}\.\d{3}\.\d{3}\-\d{2}$)|(^\d{2}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$)/g);
const isEmail = new RegExp(/^(([^<>!'#$%&()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/g)


const normalizeAccents = (str: string ): string => {
  return str.normalize("NFD").replace(hasAccent, "")
}

const onlyNumbers = (str: string): string => {
  return str.normalize("NFD").replace(onlyNumber, "")
}

const onlyLetters = (str: string): string => {
  return str.normalize("NFD").replace(onlyLetter, "")
}

export { 
  hasLetter, 
  hasCharSpecial, 
  hasCharSpecialToPhone, 
  hasCharSpecialToEmail, 
  hasAccent,
  hasNumber,
  onlyLetter,
  onlyNumber,
  isFormatCPF,
  isFormatCnpj,
  isFormatDocument,
  isEmail,
  normalizeAccents,
  onlyNumbers,
  onlyLetters,
}


