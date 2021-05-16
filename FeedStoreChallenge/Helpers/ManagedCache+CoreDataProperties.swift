//
//  ManagedCache+CoreDataProperties.swift
//  FeedStoreChallenge
//
//  Created by Romeo Flauta on 5/15/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//
//

import Foundation
import CoreData

extension ManagedCache {
	@nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedCache> {
		return NSFetchRequest<ManagedCache>(entityName: "ManagedCache")
	}

	@NSManaged public var timestamp: Date?
	@NSManaged public var feed: NSOrderedSet?
}

extension ManagedCache {
	var localFeed: [LocalFeedImage] {
		guard let feed = feed else { return [LocalFeedImage]() }
		return feed.compactMap { ($0 as? ManagedFeedImage)?.local }
	}

	static func find(in context: NSManagedObjectContext) throws -> ManagedCache? {
		let request = NSFetchRequest<ManagedCache>(entityName: entity().name ?? "ManagedCache")
		request.returnsObjectsAsFaults = false
		return try context.fetch(request).first
	}

	static func newUniqueInstance(in context: NSManagedObjectContext) throws -> ManagedCache {
		try find(in: context).map(context.delete)
		return ManagedCache(context: context)
	}
}

// MARK: Generated accessors for feed
extension ManagedCache {
	@objc(insertObject:inFeedAtIndex:)
	@NSManaged public func insertIntoFeed(_ value: ManagedFeedImage, at idx: Int)

	@objc(removeObjectFromFeedAtIndex:)
	@NSManaged public func removeFromFeed(at idx: Int)

	@objc(insertFeed:atIndexes:)
	@NSManaged public func insertIntoFeed(_ values: [ManagedFeedImage], at indexes: NSIndexSet)

	@objc(removeFeedAtIndexes:)
	@NSManaged public func removeFromFeed(at indexes: NSIndexSet)

	@objc(replaceObjectInFeedAtIndex:withObject:)
	@NSManaged public func replaceFeed(at idx: Int, with value: ManagedFeedImage)

	@objc(replaceFeedAtIndexes:withFeed:)
	@NSManaged public func replaceFeed(at indexes: NSIndexSet, with values: [ManagedFeedImage])

	@objc(addFeedObject:)
	@NSManaged public func addToFeed(_ value: ManagedFeedImage)

	@objc(removeFeedObject:)
	@NSManaged public func removeFromFeed(_ value: ManagedFeedImage)

	@objc(addFeed:)
	@NSManaged public func addToFeed(_ values: NSOrderedSet)

	@objc(removeFeed:)
	@NSManaged public func removeFromFeed(_ values: NSOrderedSet)
}

extension ManagedCache: Identifiable {}
