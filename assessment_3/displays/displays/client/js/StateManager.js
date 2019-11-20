import clamp from 'clamp';

const curTime = () => new Date().getTime() / 1000;

class State {
  name = 'STATE_NAME';
  resetTime = 0.0;
  duration = 0;
  time = 0.0;
  callbacks = [];

  /**
   *Creates an instance of State.
   * @param {String} name - name of state
   * @param {Number} duration - duration of state in seconds
   * @param {Array<Function>} [callbacks=[]] - Array of functions
   * @memberof State
   */
  constructor(name, duration, callbacks = []) {
    this.name = name;
    this.duration = duration;
    this.callbacks = callbacks;
  }

  /**
   * @description True if state has ended
   * @returns {Boolean}
   * @readonly
   * @memberof State
   */
  get ended() { return this.triggerTime + this.duration > curTime(); }


  /**
   * @description True if state has started
   * @returns {Boolean}
   * @readonly
   * @memberof State
   */
  get started() { return this.triggerTime > curTime(); }


  /**
   * @description Progress of state [0.0, 1.0]
   * @returns {Number}
   * @readonly
   * @memberof State
   */
  get progress() { return clamp((this.triggerTime - curTime()) / this.duration); }

  setTriggerTime = (time) => this.triggerTime = time;
  setResetTime = (time) => this.resetTime = time;
  addCallback = (...callbacks) => {
    callbacks.forEach(cb => this.callbacks.push(cb));
    return this;
  }
  runCallbacks = () => this.callbacks.forEach(cb => cb(this));
}

class StateManager {
  resetTime = 0.0;
  resetCallbacks = []; // Array of functions called when reset is run
  states = [new State('INITIAL_STATE', 0.0)];

  constructor() {
  }

  /**
   * @function addState
   * @description Adds a new state to the state manager
   * @param {String} stateName - Name of state
   * @param {Number} duration - Duration of state in seconds
   * @returns {State} - The newly created state;
   */
  addState = (stateName, duration) => {
    this.states.push(new State(stateName, duration));
    if (process.env.NODE_ENV === 'development') {
      this.findState(stateName).addCallback(() => {
        console.log(`Starting state ${stateName}`);
      });
    }
    return this.findState(stateName);
  }
  
  /**
   * @function findState
   * @description Finds a state by its name
   * @param {String} stateName - Name of state to find
   * @returns {State} - The found state
   */
  findState = (stateName) => this.states.find(state => state.name == stateName) || null;
  

  /**
   * @function reset
   * @description Resets the StateManager to restart the animation
   */
  reset() {
    this.resetTime = curTime();
    let offset = 0;

    console.log('StateManager resetting at time ' + this.resetTime);
    this.states.forEach(state => {
      state.setResetTime(this.resetTime);
      state.setTriggerTime(this.resetTime + offset);

      console.log(`State of ${state.name} triggerTime: ${state.triggerTime}`);
      offset += state.duration;

      setTimeout(() => {
        console.log(`State of ${state.name} has triggered running callbacks now.`);
        state.runCallbacks();
      }, offset);
    });

    this.resetCallbacks.forEach(cb => {
      cb();
    });
  }

  addResetCallback(cb) {
    this.resetCallbacks.push(cb);
  }
}

export default StateManager;