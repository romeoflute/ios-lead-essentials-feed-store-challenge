//
//  ManagedFeedImage+CoreDataProperties.swift
//  FeedStoreChallenge
//
//  Created by Romeo Flauta on 5/15/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//
//

import Foundation
import CoreData

extension ManagedFeedImage {
	@nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedFeedImage> {
		return NSFetchRequest<ManagedFeedImage>(entityName: "ManagedFeedImage")
	}

	@NSManaged public var id: UUID
	@NSManaged public var imageDescription: String?
	@NSManaged public var location: String?
	@NSManaged public var url: URL
	@NSManaged public var cache: ManagedCache?
}

extension ManagedFeedImage {
	static func images(from localFeed: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
		return NSOrderedSet(array: localFeed.map { local in
			let managed = ManagedFeedImage(context: context)
			managed.id = local.id
			managed.imageDescription = local.description
			managed.location = local.location
			managed.url = local.url
			return managed
		})
	}

	var local: LocalFeedImage {
		return LocalFeedImage(id: id, description: imageDescription, location: location, url: url)
	}
}

extension ManagedFeedImage: Identifiable {}
