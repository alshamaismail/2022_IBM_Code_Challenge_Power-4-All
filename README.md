# 2022_IBM_Code_Challenge_Power-4-All

This is the repository created by Team No. 162 for IBM hackathon. An idea under Theme 1 - Digitization To Ease Access To Social Services - was chosen and the following problem statement was formulated.

Problem Statement: 

Digitization of Electricity Board Complaint Registration with Lineman Allocation for speedy addressal of registered complaint. The proposed approach provides improvement on:
- Arbitrary visiting and servicing of electricity board complaints by lineman.
- The overhead of reaching the complaint to the lineman through various levels of staff.
- Delay in servicing complaints.

Features of the Project:
- A Web Application for electricity board complaint registration and lineman allocation for addressing the registered complaint.
- New Consumer Registration where consumers can register with their consumer number and a password to avail the services of the website.
- Login Page for Consumer and Lineman.
- Provision for Complaint Registration to register a new complaint relating to power failure or electric line/post related or meter related issues and View Complaints to view the registered complaints on the consumer side.
- Allocation of registered complaint to a lineman in the same locality having the least number of complaints.
- Provision to view the assigned duties on the lineman side.

Value of the Project:
- The newly proposed approach reduces the delay of passing the complaint through various levels of staff to reach the lineman. 
- The complaints directly reaches the lineman resulting in the speedy addresal of the complaints. 
- The Registered Complaints are automatically assigned to the lineman in  the same locality having the least number of complaints assigned. This results in unbiased allocation of complaints to the linemen.

Challenges faced and overcame:
- The design of the backend database keeping in mind the integrity constraints.
- The construction of query statement to allocate duty to the lineman in the same locality with the least number of complaints assigned.
- The construction of the query statement to view the duties assigned to a lineman by selecting data from multiple tables.

Future Scope:
- Provision for changing single phase to three phase connection.
- Provision to report to higher officials in case the complaint is unattended.
- Provision to add an Information Board to view information regarding load shedding/maintenance works as updated by an officer.

Technical Details:
- Frond End Technologies: Java Server Pages (JSP), CSS.
- Server: Glassfish Server.
- Backend Database: PostgreSQL.

The UI of the proposed system can be found at https://electricitywebsite.divyabvenugopal.repl.co/ . Note that this is only the front end part written in html and not the fully functional web application. The code for the fully functional web application can be found in the repository.

Flow Diagram:
<img src="https://github.com/divyabvenugopal/2022_IBM_Code_Challenge_Power-4-All/blob/main/image/FlowDiagram.jpeg" alt="Flow Diagram"/>

Individual Contributions:
- Alshama M.S: Documentation, Flow Diagram and UI Design of Home page and Lineman Login Page.
- Divya B Venugopal: Documentation, UI design of Consumer Login Page, Consumer's Page, Complaint Registration Page and View Complaints Page and Design and Development of backend database.
- Jomon M John: Documentation and UI Design of Lineman's Page and View Duties page for Lineman.
