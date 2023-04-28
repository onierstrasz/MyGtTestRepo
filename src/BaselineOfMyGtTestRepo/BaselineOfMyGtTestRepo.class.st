Class {
	#name : #BaselineOfMyGtTestRepo,
	#superclass : #BaselineOf,
	#category : #BaselineOfMyGtTestRepo
}

{ #category : #loading }
BaselineOfMyGtTestRepo class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'MyGtTestRepo' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / lepiter.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfMyGtTestRepo >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'MyGtTestRepo'
		]
]
