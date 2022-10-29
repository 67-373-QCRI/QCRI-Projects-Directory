# === Users ====

@u_ykhanfar = User.create(username: "ykhanfar", email: "ykhanfar@andrew.cmu.edu", password: "admin123", password_confirmation: "admin123", admin: true)
@u_aminhaj = User.create(username: "aminhaj", email: "mahmad@hbku.edu.qa", password: "aminhaj123", password_confirmation: "aminhaj123")
@u_srizzo = User.create(username: "srizzo", email: "strizzo@hbku.edu.qa", password: "srizzo123", password_confirmation: "srizzo123")
@u_amusleh = User.create(username: "amusleh", email: "amusleh@hbku.edu.qa", password: "amusleh123", password_confirmation: "amusleh123")
@u_ahomaid = User.create(username: "ahomaid", email: "abalhomaid@hbku.edu.qa", password: "ahomaid123", password_confirmation: "ahomaid123")

# === Researchers ===

@r_ykhanfar = Researcher.create(user: @u_ykhanfar, first_name: "Yousef", last_name: "Khanfar", group: "Computational Biology", job_title: "Software Developer", phone_number: "3375 7580", office_location: "Hall A, Room 203", github_url: "https://github.com/ykhanfar", is_leader: true)
@r_minhaj = Researcher.create(user: @u_aminhaj, first_name: "Ahmad", last_name: "Minhaj", group: "Cybersecurity", job_title: "Software Engineer", phone_number: "4454 6158", office_location: "RC-B1-1144", is_leader: true)
@r_srizzo = Researcher.create(user: @u_srizzo, first_name: "Stefano", last_name: "Rizzo", group: "Data Analytics", job_title: "Post Doc")
@r_amusleh = Researcher.create(user: @u_amusleh, first_name: "Ahmad", last_name: "Musleh", group: "Software Engineering", job_title: "Software Engineer", office_location: "RC-B1-1267")
@r_ahomaid = Researcher.create(user: @u_ahomaid, first_name: "Abdulaziz", last_name: "Al-Homaid", group: "Social Computing", job_title: "Research Associate", phone_number: "5586 9646")

# Researcher attachments
@r_minhaj.avatar.attach(io: File.open('E:\QCRI-Project\QCRI\app\assets\images\seed-images\r_aminhaj.jpg'), filename: 'r_aminhaj.jpg', content_type: 'image/jpg')
@r_srizzo.avatar.attach(io: File.open('E:\QCRI-Project\QCRI\app\assets\images\seed-images\r_srizzo.png'), filename: 'r_srizzo.png', content_type: 'image/png')
@r_amusleh.avatar.attach(io: File.open('E:\QCRI-Project\QCRI\app\assets\images\seed-images\r_amusleh.jpg'), filename: 'r_amusleh.jpg', content_type: 'image/jpg')
@r_ahomaid.avatar.attach(io: File.open('E:\QCRI-Project\QCRI\app\assets\images\seed-images\r_ahomaid.png'), filename: 'r_ahomaid.png', content_type: 'image/png')

# === Projects ===

@pj_qarsumo = Project.create(name: "QarSUMO",
                             description: "QarSUMO is a parallel, congestion-optimized version of the popular SUMO open-source traffic simulator. QarSUMO performs high-level parallelization on top of SUMO, to utilize powerful multi-core servers and enables future extension to multi-node parallel simulation if necessary. The proposed design, while partly sacrificing speedup, makes QarSUMO compatible with future SUMO improvements",
                             team_leader_id: 3,
                             members: [3,4],
                             start_date: Date.current - 2.years,
                             end_date: Date.current - 30.days
)
@pj_qarsumo.researchers << @r_srizzo
@pj_qarsumo.researchers << @r_amusleh

@pj_qsm = Project.create(name: "QSM",
                             description: "Inferring road graphs from satellite imagery is a challenging computer vision task. Prior solutions fall into two categories: (1) pixel-wise segmentation-based approaches, which predict whether each pixel is on a road, and (2) graph-based approaches, which predict the road graph iteratively. We find that these two approaches have complementary strengths while suffering from their own inherent limitations. In this paper, we propose a new method, Sat2Graph, which combines the advantages of the two prior categories into a unified framework.",
                             team_leader_id: 2,
                             members: [2, 3, 5],
                             start_date: Date.current - 1.year
)
@r_minhaj.update_attribute(:project_id, @pj_qsm.id)
@pj_qsm.researchers << @r_minhaj
@pj_qsm.researchers << @r_srizzo
@pj_qsm.researchers << @r_ahomaid

# Project attachments

@pj_qarsumo.image.attach(io: File.open('E:\QCRI-Project\QCRI\app\assets\images\seed-images\pj_qarsumo.png'), filename: 'pj_qarsumo.png', content_type: 'image/png')
@pj_qsm.image.attach(io: File.open('E:\QCRI-Project\QCRI\app\assets\images\seed-images\pj_qsm.png'), filename: 'pj_qsm.png', content_type: 'image/png')

# === Publications ===

@pb_qarsumo = Publication.create(title: "QarSUMO: A Parallel, Congestion-optimized Traffic Simulator", published: true, published_on: Date.new(2020, 11, 13), conference: "Proceedings of the 28th International Conference on Advances in Geographic Information Systems", page_from: 578, page_to: 588, doi: "10.1145/3397536.3422274")
@pb_qsm = Publication.create(title: "Sat2Graph: Road Graph Extraction Through Graph-Tensor Encoding", published: true, published_on: Date.new(2020, 11, 30), conference: "ECCV 2020: Computer Vision – ECCV 2020", page_from: 51, page_to: 67, doi: "10.1007/978-3-030-58586-0_4")

@pj_qarsumo.publications << @pb_qarsumo
@pj_qsm.publications << @pb_qsm
