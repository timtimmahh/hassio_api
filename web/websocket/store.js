export const createStore = (state) => {
  let listeners = [];

  function unsubscribe(listener) {
    let out = [];
    for (let i = 0; i < listeners.length; i++) {
      if (listeners[i] === listener) {
        listener = null;
      } else {
        out.push(listeners[i]);
      }
    }
    listeners = out;
  }

  function setState(update, overwrite) {
    state = overwrite ? update : Object.assign(Object.assign({}, state),
        update);
    let currentListeners = listeners;
    for (let i = 0; i < currentListeners.length; i++) {
      currentListeners[i](state);
    }
  }

  /**
   * An observable state container, returned from {@link createStore}
   * @name store
   */
  return {
    get state() {
      return state;
    },
    /**
     * Create a bound copy of the given action function.
     * The bound returned function invokes action() and persists the result back to the store.
     * If the return value of `action` is a Promise, the resolved value will be used as state.
     * @param {Function} action  An action of the form `action(state, ...args) -> stateUpdate`
     * @returns {Function} boundAction()
     */
    action(action) {
      function apply(result) {
        setState(result, false);
      }

      // Note: perf tests verifying this implementation: https://esbench.com/bench/5a295e6299634800a0349500
      return function () {
        let args = [state];
        for (let i = 0; i < arguments.length; i++) {
          args.push(arguments[i]);
        }
        // @ts-ignore
        let ret = action.apply(this, args);
        if (ret != null) {
          return ret instanceof Promise ? ret.then(apply) : apply(ret);
        }
      };
    },
    /**
     * Apply a partial state object to the current state, invoking registered listeners.
     * @param {Object} update        An object with properties to be merged into state
     * @param {Boolean} [overwrite=false]  If `true`, update will replace state instead of being merged into it
     */
    setState,
    /**
     * Register a listener function to be called whenever state is changed. Returns an `unsubscribe()` function.
     * @param {Function} listener  A function to call when state changes. Gets passed the new state.
     * @returns {Function} unsubscribe()
     */
    subscribe(listener) {
      listeners.push(listener);
      return () => {
        unsubscribe(listener);
      };
    },
    // /**
    //  * Remove a previously-registered listener function.
    //  * @param {Function} listener	The callback previously passed to `subscribe()` that should be removed.
    //  * @function
    //  */
    // unsubscribe,
  };
};
