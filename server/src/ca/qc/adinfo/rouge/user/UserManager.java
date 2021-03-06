/*
 * Copyright [2011] [ADInfo, Alexandre Denault]
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package ca.qc.adinfo.rouge.user;

import java.util.Collection;
import java.util.HashMap;

import ca.qc.adinfo.rouge.module.RougeModule;

public class UserManager extends RougeModule {
	
	private HashMap<String, User> usersByName;
	private HashMap<Long, User> usersById;
	
	public UserManager() {
		
		this.usersByName = new HashMap<String, User>();
		this.usersById = new HashMap<Long, User>();
	}
	
	public void registerUser(User user) {
		
		synchronized (this.usersByName) {
			this.usersByName.put(user.getUsername(), user);
		}
		
		synchronized (this.usersById) {
			this.usersById.put(user.getId(), user);
		}
	}
	
	public void unregisterUser(User user) {
		
		synchronized (this.usersByName) {
			this.usersByName.remove(user.getUsername());
		}
		
		synchronized (this.usersById) {
			this.usersById.remove(user.getId());
		}
		
	}
	
	public User getUser(String username) {
		
		synchronized (this.usersByName) {
			return this.usersByName.get(username);
		}
	}
	
	public User getUserById(long id) {
		
		synchronized (this.usersById) {
			return this.usersById.get(id);
		}
	}
	
	public Collection<User> getUsers() {
		
		synchronized (usersByName) {
			return this.usersByName.values();
		}
	}

	@Override
	public void tick(long time) {
		
	}

}
