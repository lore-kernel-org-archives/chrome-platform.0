Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C79A1C3B
	for <chrome-platform@lists.linux.dev>; Wed, 20 Jul 2022 04:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43737C3411E;
	Wed, 20 Jul 2022 04:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658292499;
	bh=wOjYPC4r5oDa/JEWI74VO/GxlXIOAT2r+9/9E5jV7Q4=;
	h=From:To:Cc:Subject:Date:From;
	b=G0KDCYmEZsAwTBwEuDCOjfSaCT24ZfVV7BdZveWwYOJsayHe1ACX5qXxe5483ALnm
	 B3IbcepLkujvX2DY5v7LgAaFyA80HC2e9bomQ/K/HoqgVzOjVcMusRRmvAD6wdV3yd
	 +q398r0uHcF9Ak2u0rYRzPhf1UI/b1PmW5+oHAEqneZF1Km8oS9RMTzABF3/Ar1i/T
	 QnsPahplGOqHn9nqCJKQ8WSoCoKwILynGfv0F0Lt5F11bFridPsHRjqNdS+51ArkJz
	 JxSynGmzpP8xVylKIfeQZvqXfv00aifMj2nVDWQSHgFLOq+lDT5ENoAbOiTBiHvkwh
	 VXt89R7BtIZyQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH 0/2] platform/chrome: avoid garbage bytes in `msg->result`
Date: Wed, 20 Jul 2022 04:47:52 +0000
Message-Id: <20220720044754.4026295-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 1st patch merges Kunit utils and test cases.  The idea is basically from
the review comment in [1].

The 2nd patch fixes that `msg->result` would be garbage bytes if the mock list
is empty.  This is separated from previous series [2].

[1]: https://patchwork.kernel.org/project/chrome-platform/patch/20220718050914.2267370-2-tzungbi@kernel.org/#24944149
[2]: https://patchwork.kernel.org/project/chrome-platform/patch/20220718050914.2267370-2-tzungbi@kernel.org/

Tzung-Bi Shih (2):
  platform/chrome: merge Kunit utils and test cases
  platform/chrome: cros_kunit_util: add default value for `msg->result`

 drivers/platform/chrome/Kconfig           | 10 ++--------
 drivers/platform/chrome/Makefile          |  5 +++--
 drivers/platform/chrome/cros_kunit_util.c | 20 +++++---------------
 drivers/platform/chrome/cros_kunit_util.h |  1 +
 4 files changed, 11 insertions(+), 25 deletions(-)

-- 
2.37.0.170.g444d1eabd0-goog

