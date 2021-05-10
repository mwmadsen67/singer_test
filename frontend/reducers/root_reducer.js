import entitiesReducer from './entities_reducer';

const rootReducer = (state = {}, action) => {
    // debugger
    return {
        entities: entitiesReducer(state.entities, action),
    };
};

export default rootReducer;