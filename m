Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4357E
	for <chrome-platform@lists.linux.dev>; Tue,  1 Nov 2022 11:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9F5C433C1;
	Tue,  1 Nov 2022 11:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302067;
	bh=gya0bJPhRIzVdB0g3VDNw7gd6/xMQzaHVCvDAQ7OOLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cvtR+s92y+Bk+pbPtngKSfAZYpKO8PIelKj11l8lDysJq5qk5hnED46cqHtBNpvTP
	 6IN4pRB7xLGiXWugV/tO7NmN8VR5bqwz9wQfd1ao0fGojYfAg8uCTM+/NQS1feCFOs
	 XJoBcDIrkPjdS32iEYLDk9/ZA8caF4u+G1JqjJsXWQkrX4VidC+OHAjLGhvcNfYcXd
	 7XwejT9OyJC/nD8qVRo3ruFNzzU41W4Iz9uD+im8M24lxiMmTErsUsW1U1OkMzt5Vy
	 Odg3dwUp7jeC11bSWPfv//qNHowNlrfNm8IxyszX//qtHrRo4i0vpHM5k3sRK0SXpj
	 7bmfWIiiB7aNw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Rory Liu <hellojacky0226@hotmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	bleung@chromium.org,
	groeck@chromium.org,
	scott_chao@wistron.corp-partner.google.com,
	ajye_huang@compal.corp-partner.google.com,
	zhuohao@chromium.org,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH AUTOSEL 6.0 09/34] media: platform: cros-ec: Add Kuldax to the match table
Date: Tue,  1 Nov 2022 07:27:01 -0400
Message-Id: <20221101112726.799368-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101112726.799368-1-sashal@kernel.org>
References: <20221101112726.799368-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Rory Liu <hellojacky0226@hotmail.com>

[ Upstream commit 594b6bdde2e7833a56413de5092b6e4188d33ff7 ]

The Google Kuldax device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Rory Liu <hellojacky0226@hotmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index e5ebaa58be45..6ebedc71d67d 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -223,6 +223,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Moli", "0000:00:02.0", "Port B" },
 	/* Google Kinox */
 	{ "Google", "Kinox", "0000:00:02.0", "Port B" },
+	/* Google Kuldax */
+	{ "Google", "Kuldax", "0000:00:02.0", "Port B" },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.35.1

