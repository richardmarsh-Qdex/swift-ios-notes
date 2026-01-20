import SwiftUI

struct NoteDetailView: View {
    @State var note: Note
    @ObservedObject var viewModel: NotesViewModel
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            if isEditing {
                TextField("Title", text: $note.title)
                    .font(.title)
                TextEditor(text: $note.content)
            } else {
                Text(note.title)
                    .font(.title)
                Text(note.content)
                    .padding()
            }
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(isEditing ? "Done" : "Edit") {
                    if isEditing {
                        viewModel.updateNote(note)
                    }
                    isEditing.toggle()
                }
            }
        }
    }
}
