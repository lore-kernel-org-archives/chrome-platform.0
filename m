Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E4E3CE494;
	Mon, 27 Apr 2026 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297655; cv=none; b=Offp8NFXDvmPW8IXE+94zrhxJAsWuywbf20mhINl0meYZwTNhtaJThbzw8iB63fEIk5UwbYNY8MjiSskzeiuidKZrY8HHZunOyt2oakyEsFZ0lpV5k3/jm8uEu837aZ/SBi26mxZuERROqSvaOe+wR1RICb1pYWwaQbKaHqD0xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297655; c=relaxed/simple;
	bh=WEaOL63z243niqPDr3WH6aBBausSwFKU8g0g85xTb5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gOq6ZIJwvTKj85b8zrJX2/OFYTgaDU1fNVhKWC9GDCS07eQ6N3WFh9tFZE0WGANfxhfY8gEfv/VJV9ZEZH5/QGNwbk4ygY+DNhT0MX6+zBTEvtwqKY2pDWJE0EyyyrxVJB36Iz1sizcc1de81/GXWqBRMPsP7upLBvvy3bqGZng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDcTo4kC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDcTo4kC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD23C19425;
	Mon, 27 Apr 2026 13:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777297654;
	bh=WEaOL63z243niqPDr3WH6aBBausSwFKU8g0g85xTb5o=;
	h=From:To:Cc:Subject:Date:From;
	b=jDcTo4kCmV7Avs3e8oBG+rs2DZT4KcwULV2ofiW16VTs7uq0lFpeKt2inxWdvoinQ
	 vqbPK5qZmfu2zrdQAnBVa7Tt+kgvgY7dCNPDs7HKhMfjxNEun3gzUkHAxwCtYtC+5w
	 1GBEiUNxRCX+2njeYQMMhdJzETEjPH+VYVKDWlwn7V+HWDGE1uGw47BPpNjeW+qf/i
	 Z3739rzsPvLZWQb5VbOwpzSLV+p6x6nkEZfJX4YvR0AMwm5rbGwA/0V315a3sY+L22
	 vZ3bfX3sAnSSvKleEGnk80LcKgmtZFZZsvUzHYSBPkVW7t+rz47WIFN0Xt64IV4cF3
	 00K9Q4/IgaDag==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benson Leung <bleung@chromium.org>,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 0/8] char: misc: Introduce misc_sync to fix UAF
Date: Mon, 27 Apr 2026 21:46:51 +0800
Message-ID: <20260427134659.95181-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces misc_sync to address potential Use-After-Free
errors when a device is deregistered while file operations are still in
progress or files remain open.  It then adopts the mechanism in
cros_ec_chardev driver.

- Patches 1 and 2 are independent refactors in the misc subsystem.
  These are safe cleanups and should be fine to apply.

- Patch 3 is the initial Proof-of-Concept for misc_sync.  It uses a
  global lock to serialize file operations, so a performance downgrade
  is expected.

- Patch 4 is an improvement over the PoC that replaces the global lock
  with SRCU for list traversal in the file operations, avoiding
  performance bottlenecks.

- Patches 5 to 7 are preparation steps in cros_ec_chardev driver.  They
  introduce reference counting for platform driver data and an event
  relayer.  This removes the direct access to `ec_dev->event_notifier`
  in `cros_ec_chardev_release()`, which is a prerequisite for using
  misc_sync safely in this driver.

- Patch 8 switches cros_ec_chardev driver to use misc_sync.

Tzung-Bi Shih (8):
  char: misc: Simplify locking with guard()
  char: misc: Introduce misc_find() helper
  char: misc: Introduce misc_sync_register()
  char: misc: Use SRCU to protect list traversal
  platform/chrome: cros_ec_chardev: Introduce chardev_data
  platform/chrome: cros_ec_chardev: Move data to chardev_pdata
  platform/chrome: cros_ec_chardev: Add event relayer
  platform/chrome: cros_ec_chardev: Use misc_sync_register()

 drivers/char/misc.c                       | 228 +++++++++++++++++-----
 drivers/platform/chrome/cros_ec_chardev.c | 113 ++++++++---
 include/linux/miscdevice.h                |  10 +
 3 files changed, 272 insertions(+), 79 deletions(-)

-- 
2.51.0

