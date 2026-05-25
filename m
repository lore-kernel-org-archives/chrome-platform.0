Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0815A33E35B;
	Mon, 25 May 2026 05:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779686844; cv=none; b=NF2lAi5wrdulGebnwYT3HUyGN+9fAc7Xrs/uVOlBTLzK4UtBvPDLbWl90RLjAZ4rN48L/tAUx9l1b7cAvDQi0WkN8n509396aM/n3n/ad7X6qtrbT0FVUJlYRHg9iFhP0sCg7oJk8uZTG2OnLOYwpB0pZDtsraY0uMLKal63XTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779686844; c=relaxed/simple;
	bh=3oAMi9ittPrliGSJW+c7RuzQl6VYxCIF8kpZXF3sJ0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z8WPteVXvaRmK07J4TpMnqqx5aI+qzXJTXTuJai+zGkZ9LAXuZuvjaYB4XjzCKkqC+Xyl+0tK2YMZa+t2qIxvOYXu9nxuyJ1fO4LI/2FXYZs7Qlua9oqcss115ntNFG4YuhcnBonuHeRjL9CpZDdfpwALK13O86ppaT+FIdEz2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APPg+tZP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APPg+tZP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759211F000E9;
	Mon, 25 May 2026 05:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779686842;
	bh=fgLI1PYxrt6MK9Z2WMoqAQYIUYVqLYc9yY3U07UK+ag=;
	h=From:To:Cc:Subject:Date;
	b=APPg+tZPqMTbRMQHHgNlEY+ADkU0jP+XOIxL+VoFcJBZMLgoS3H4KIlWsWD6jntzQ
	 lf9vhAA1UP7gS2qGz+kqIKVQD+ScFjtKsphymsuYmgGLmoAt/oE+FjTAVfXtp7eKgd
	 NGzewAAJpvdBaQifOWCMjRDTyQChsaFnKfj629E5bZBL+a+A712EM9Dg5e3votgSYE
	 0mRydohOXYMkrLTluiJiF6qUBWbD/lCni3Pg5ShCGosYy5cUnsO6Dit0lXtMV4qYx9
	 WTpe9rBB2Y1qV9AGscq97ZMs/gfYgU+MhdyXnplefXFeelOclDRQNi/Vad5XgJ/Wju
	 vr9Vc7au0R51Q==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] platform/chrome: cros_ec_chardev: Fix a potential UAF
Date: Mon, 25 May 2026 05:26:50 +0000
Message-ID: <20260525052654.4076429-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  This series addresses a potential Use-After-Free error when a device is
deregistered while file operations are still in progress or files remain
open in cros_ec_chardev.

- Patches 1 to 3 are preparation steps in cros_ec_chardev driver.  They
  introduce reference counting for platform driver data and an event
  relayer.  This removes the direct access to `ec_dev->event_notifier`
  in `cros_ec_chardev_release()`.
- Patch 4 introduces a rwsem for protecting `ec_dev` to prevent the UAF
  error.

---
v3:
- Address review comment in patch 4.

v2: https://lore.kernel.org/all/20260516143017.18560-1-tzungbi@kernel.org
- Merge patches 5 to 7 from
  https://lore.kernel.org/all/20260427134659.95181-1-tzungbi@kernel.org.

v1: Doesn't exist.

Tzung-Bi Shih (4):
  platform/chrome: cros_ec_chardev: Introduce chardev_data
  platform/chrome: cros_ec_chardev: Move data to chardev_pdata
  platform/chrome: cros_ec_chardev: Add event relayer
  platform/chrome: cros_ec_chardev: Introduce rwsem for protecting
    ec_dev

 drivers/platform/chrome/cros_ec_chardev.c | 146 +++++++++++++++++-----
 1 file changed, 116 insertions(+), 30 deletions(-)

-- 
2.54.0.794.g4f17f83d09-goog

