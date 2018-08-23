/*
*    DelianCubeEngine. A simple cube query engine.
*    Copyright (C) 2018  Panos Vassiliadis
*
*    This program is free software: you can redistribute it and/or modify
*    it under the terms of the GNU Affero General Public License as published
*    by the Free Software Foundation, either version 3 of the License, or
*    (at your option) any later version.
*
*    This program is distributed in the hope that it will be useful,
*    but WITHOUT ANY WARRANTY; without even the implied warranty of
*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*    GNU Affero General Public License for more details.
*
*    You should have received a copy of the GNU Affero General Public License
*    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*
*/


package client.naiveJavaClient;

import java.io.File;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.util.ArrayList;

import client.ClientRMITransferer;
import client.gui.utils.FileInfoProvider;
import mainengine.IMainEngine;
/**
 * A simple client that 
 * (a) locates an RMI server in the HOST at PORT
 * (b) issues queries against a specific cubebase and a specific cube
 * 
 * @author pvassil
 *
 */
public class NaiveJavaClient {

	// Host or IP of Server
	private static final String HOST = "localhost";
	private static final int PORT = 2020;
	private static Registry registry;

	public static void main(String[] args) throws Exception {
		// Search the registry in the specific Host, Port.
		registry = LocateRegistry.getRegistry(HOST, PORT);
		// LookUp for MainEngine on the registry
		IMainEngine service = (IMainEngine) registry.lookup(IMainEngine.class
				.getSimpleName());
		if(service == null) {
			System.out.println("Unable to commence server, exiting");
			System.exit(-100);
		}
		// The first arg is audio; the second is for Word
		//service.optionsChoice(false, false);
		
		
		
		// Cube ADULT and queries
		/*service.initializeConnection("adult_no_dublic", "CinecubesUser",
				"Cinecubes", "adult", "adult");
		File f = new File("InputFiles/cubeQueries.ini");
		service.answerCubeQueriesFromFile(f);/**/
				
		// Cube LOAN and queries
		service.initializeConnection("pkdd99", "CinecubesUser",
				"Cinecubes", "pkdd99", "loan");
		System.out.println("Completed connection initialization");

		//Run queries
		//File f2 = new File("InputFiles/cubeQueriesloan.ini");
		File f2 = new File("InputFiles/loanQueries.txt");
		//File f2 = new File("InputFiles/try.txt");
		ArrayList<String> fileLocations = service.answerCubeQueriesFromFile(f2);
		
		// Cube ORDERS and queries
		/*service.initializeConnection("pkdd99", "CinecubesUser",
				 "Cinecubes", "pkdd99", "orders");
		File f4 = new File("InputFiles/cubeQueriesorder.ini");
		service.answerCubeQueriesFromFile(f4);/**/
		
		
		for(String s: fileLocations) {
			System.out.println("Find the next result at " + s);
			File remote = new File(s);
			String[] array = s.split("/");
			String localName = "NoName";
			if (array.length > 0)
				localName = array[array.length-1].trim();

			ClientRMITransferer.download(service, remote, new File("ClientCache/" + localName));
			//TODO: add the download of the info files
		}
		System.out.println("Execution of client is complete");
	}

}