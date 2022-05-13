Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF66163
	for <chrome-platform@lists.linux.dev>; Fri, 13 May 2022 04:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC8AC34100;
	Fri, 13 May 2022 04:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652416912;
	bh=oxAlRx4MzJ+PAn+aE8dvVxfRtIou9yLuSLdN2OrKr3g=;
	h=From:To:Cc:Subject:Date:From;
	b=IkiovpWnIeTJeDWfUItnDXAr0x8pl5ILas0+jgZPDGwoKJLoEW3RW9kuGUR0clhlW
	 76kuYy6rZ2MgX9vN0hjjoRHU8j4ySNPmuDBFkm9r6cQ6KfZMiqVJFjW3MDnEQ+IHaG
	 7/8YExvIfPlb8ClyCIyCBbYfXxzpkKLDkgpL1wjY5taNRbsrGoPs51zSd5MqQ18HhN
	 uuh4hlOiDconVmSFouaDE7N7PXjNyZBmwbj16APJNKhARHJIBIVjNRs5XjDJ/h7sup
	 DYal0YmBEExjhltfNi3g5W8g+/P2Ck6CUuto8uzDdMPmpL7Wy/CUxrp5wGzxq/QfOd
	 pIPhXNI1NlMyw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] platform/chrome: get rid of BUG_ON()
Date: Fri, 13 May 2022 12:41:36 +0800
Message-Id: <20220513044143.1045728-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series gets rid of BUG_ON()s in drivers/platform/chrome/.  Most of them
can be replaced by returning proper return code.

The 2nd patch makes callers of cros_ec_prepare_tx() to take care of the
return code.

The 3rd patch turns cros_ec_prepare_tx() to return error code if any.

Changes from v1:
(https://patchwork.kernel.org/project/chrome-platform/cover/20220512083627.885338-1-tzungbi@kernel.org/)
- Split the original 6th patch into 2 smaller patches. 

Tzung-Bi Shih (7):
  platform/chrome: cros_ec_proto: drop unneeded BUG_ON() in
    prepare_packet()
  platform/chrome: correct cros_ec_prepare_tx() usage
  platform/chrome: cros_ec_proto: drop BUG_ON() in cros_ec_prepare_tx()
  platform/chrome: cros_ec_proto: drop BUG_ON() in
    cros_ec_get_host_event()
  platform/chrome: cros_ec_i2c: drop BUG_ON() in cros_ec_pkt_xfer_i2c()
  platform/chrome: cros_ec_spi: drop unneeded BUG_ON()
  platform/chrome: cros_ec_spi: drop BUG_ON() if `din` isn't large
    enough

 drivers/platform/chrome/cros_ec_i2c.c   | 12 ++++++++++--
 drivers/platform/chrome/cros_ec_ishtp.c |  4 +++-
 drivers/platform/chrome/cros_ec_lpc.c   |  2 ++
 drivers/platform/chrome/cros_ec_proto.c | 13 ++++++++-----
 drivers/platform/chrome/cros_ec_rpmsg.c |  2 ++
 drivers/platform/chrome/cros_ec_spi.c   | 15 ++++++++++-----
 6 files changed, 35 insertions(+), 13 deletions(-)

-- 
2.36.0.550.gb090851708-goog

