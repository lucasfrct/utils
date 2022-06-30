/**
 * Cria padrões de datas com formatos usuais para o Brasil 
 */

 interface Datetime {
  date: Date, 
  year: string, 
  month: string,
  day: string, 
  hour: string, 
  minute: string, 
  second: string, 
  millisecond: string,
  zone: string,
  timestamp: number,
  CLOCK: string,
  clock: string,
  US: string,
  us: string,
  UTC: string,
  utc: string,
  BR: string,
  br: string,
  TIME: string,
  time: string,
  format: Function,
  subtractMonth: Function,
  error: string | null
}

/**
 * Set uma data com timezone
 * @param date {Date}
 * @param timeZone {String} 
 * @return {Date}
 */
const Zone = (date: Date = new Date(), timeZone: string = 'America/Sao_Paulo'): Date => {
  return new Date((date).toLocaleString("en-US", {timeZone}));   
}

/**
 * Controí um objeto de data
 * @param dateSet 
 * @param zone 
 * @returns 
 */
const DateAssembler = (dateSet: any = new Date(), zone: string = 'America/Sao_Paulo'): Datetime => {

  if(typeof dateSet === 'string') {
    dateSet = Date.parse(dateSet);

    if(dateSet === null) {
      return <Datetime>{ error: 'Data inválida' };
    }

    dateSet = new Date(dateSet);
  }

  const date = Zone(dateSet, zone);
  const year = String(date.getFullYear()).padStart(4, '0');
  const month = String(date.getMonth() + 1).padStart(2, '0');
  const day = String(date.getDate()).padStart(2, '0');

  const hour = String(date.getHours()).padStart(2, '0');
  const minute = String(date.getMinutes()).padStart(2, '0');
  const second = String(date.getSeconds()).padStart(2, '0');
  const millisecond = String(date.getMilliseconds()).padStart(3, '0');

  const timestamp = Number(date.getTime());
  const timestampString = timestamp.toString()
  
  const CLOCK = `${hour}:${minute}:${second}`;
  const clock = `${hour}${minute}`;
  
  const US = `${year}-${month}-${day}`;
  const us = `${year}${month}${day}`;
  
  const UTC = date.toISOString();
  const utc =  `${US} ${CLOCK}`;
  const BR = `${day}/${month}/${year}`;
  const br = `${day}-${month}-${year}`;

  const TIME = `${CLOCK}.${millisecond}`;
  const time = `${clock}${second}${millisecond}`;

  function format(tmp: string = 'dd/mm/yyyy') {

    tmp = tmp.replace('dd', day).replace('mm', month).replace('yyyy', year);
    tmp = tmp.replace('HH', hour).replace('MM', minute).replace('SS', second).replace('ss', millisecond);
    tmp = tmp.replace('CC', CLOCK).replace('cc', clock).replace('tt', timestampString);
    tmp = tmp.replace('US', US).replace('us', us);
    tmp = tmp.replace('UTC', UTC).replace('utc', utc);
    tmp = tmp.replace('BR', BR).replace('br', br);
    tmp = tmp.replace('TIME', TIME).replace('time', time);
    
    return tmp;
  }

  function subtractMonth(subMonth: number = 0) {
    date.setMonth(date.getMonth() - subMonth);
    return date;
  }

  return <Datetime>{ 
    date, 
    year, 
    month, 
    day, 
    hour, 
    minute, 
    second, 
    millisecond, 
    zone, 
    timestamp,
    CLOCK,
    clock,
    US,
    us,
    UTC,
    utc,
    BR,
    br,
    TIME,
    time,
    error: null,
    format,
    subtractMonth,
  };
}

export { DateAssembler as Datetime,  };