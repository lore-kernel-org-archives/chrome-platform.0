Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521081DED5C;
	Sat, 16 May 2026 14:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778941831; cv=none; b=cdQ0WvIkRBX0HYWL1Fxtg90G+Z2g4A1Svwdq2uwKmw04e9Q9nhWWwTmkat89Bdk7Fx2I9rNRe5PrOXtOFdNLkzqrvzm2XiNthomAVOdiKj2VmFz6rmZpBfWqr3XNiiV0ZuF08jIJoZP7gxPIuoRUIDX8aMTeU5oZ+kHtQTrDPTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778941831; c=relaxed/simple;
	bh=8SF9iQYxYdbu4FBU7k9gec8O7+GqfhQKuofkWW+r1+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WEFC9Qhk8Q5uVIShlVp6Tvzrg0ejMUrb7RrPWyL8VAHVlArv04bA7B2YohfRsUP5ls6JTkkwU0GGYovouJEFOTQpdDqJA7+j26cIpcLHa91L22KzGBxAGnNWJGhvmnQDly/GUrKNsEF1A7XZmy7V4PcezFXXp6fkq3zz6TslpmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pc2Wsxzy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pc2Wsxzy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855C9C19425;
	Sat, 16 May 2026 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778941831;
	bh=8SF9iQYxYdbu4FBU7k9gec8O7+GqfhQKuofkWW+r1+0=;
	h=From:To:Cc:Subject:Date:From;
	b=Pc2WsxzyzyzesiDgYbs7rUY5C6Cet7hzZK8DXv39AWWQ2Hh/zwvhYiAX0bEXu1+hy
	 77Y21eR0bkVuie92nwfNmpKC9zT7B61tSwKVKt4wZEiinNI/xu/pMvR8JjzlYub1nt
	 LVigqkSHGM9ya5kAwA7ApXaNfm+CkGUNAptrulvHng1Hn+Edrm2xwD0MudgD+x4rMM
	 cQ8tEeGV3RdARVhwEMoBs2Qz3eG1w4QRL6f3OftD2/GZD9ZknOyYBBgM33PP1o4A79
	 GljozGF4sPtSMvnCslv+IxZEFgMFJYxFtaXcY4fnWdEjVm5RJA7uDL+q2OeFauQD/d
	 fUA8PVKxl8VsQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] platform/chrome: cros_ec_chardev: Fix a potential UAF
Date: Sat, 16 May 2026 22:30:13 +0800
Message-ID: <20260516143017.18560-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
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
v2:
- Merge patches 5 to 7 from
  https://lore.kernel.org/all/20260427134659.95181-1-tzungbi@kernel.org.

v1: Doesn't exist.

Tzung-Bi Shih (4):
  platform/chrome: cros_ec_chardev: Introduce chardev_data
  platform/chrome: cros_ec_chardev: Move data to chardev_pdata
  platform/chrome: cros_ec_chardev: Add event relayer
  platform/chrome: cros_ec_chardev: Introduce rwsem for protecting
    ec_dev

 drivers/platform/chrome/cros_ec_chardev.c | 171 +++++++++++++++++-----
 1 file changed, 132 insertions(+), 39 deletions(-)

-- 
2.51.0

