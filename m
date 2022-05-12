Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04E117FB
	for <chrome-platform@lists.linux.dev>; Thu, 12 May 2022 08:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3B3C385B8;
	Thu, 12 May 2022 08:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652344609;
	bh=3e5g6lhyha4VVxzhEZrSIdhjvbVTgz6Wec7JaF8MggI=;
	h=From:To:Cc:Subject:Date:From;
	b=fzxUcUT+iAN8VGvPA3YzzKI7NdkBfHJyPG2hgMqLywMtAeNASINqC+GbVP+Oosgnv
	 n2IgFyK8BQo4efm45Oa2u1gdxrtxgiD8pKjn7ggbqqF27DD5FqH9yS2JssT8vBTYMS
	 LguibDQrrEh1epPN65IA3niSh3P7ar4PomTuxjaubKoRLmJ8QmQ6y8lgD8xpVF0kFZ
	 TjpAr6c1oSTsddOS8GSRTyYkQsUf13WnG0OwErPxAXs0f6GaxKl/AQ2jROpKVFZvcC
	 DNi9Qmh/35lpa6H83U93JGDdNKpDwt4ST3vmTFFVbdpUCIlhsUG/I46r2dJSFDYfP+
	 hIpABfuP1JhyQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] platform/chrome: get rid of BUG_ON()
Date: Thu, 12 May 2022 16:36:21 +0800
Message-Id: <20220512083627.885338-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.0.512.ge40c2bad7a-goog
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

Tzung-Bi Shih (6):
  platform/chrome: cros_ec_proto: drop unneeded BUG_ON() in
    prepare_packet()
  platform/chrome: correct cros_ec_prepare_tx() usage
  platform/chrome: cros_ec_proto: drop BUG_ON() in cros_ec_prepare_tx()
  platform/chrome: cros_ec_proto: drop BUG_ON() in
    cros_ec_get_host_event()
  platform/chrome: cros_ec_i2c: drop BUG_ON() in cros_ec_pkt_xfer_i2c()
  platform/chrome: cros_ec_spi: drop BUG_ON()

 drivers/platform/chrome/cros_ec_i2c.c   | 12 ++++++++++--
 drivers/platform/chrome/cros_ec_ishtp.c |  4 +++-
 drivers/platform/chrome/cros_ec_lpc.c   |  2 ++
 drivers/platform/chrome/cros_ec_proto.c | 13 ++++++++-----
 drivers/platform/chrome/cros_ec_rpmsg.c |  2 ++
 drivers/platform/chrome/cros_ec_spi.c   | 19 ++++++++++++++-----
 6 files changed, 39 insertions(+), 13 deletions(-)

-- 
2.36.0.512.ge40c2bad7a-goog

