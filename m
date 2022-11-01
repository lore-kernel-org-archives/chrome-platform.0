Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAED77E
	for <chrome-platform@lists.linux.dev>; Tue,  1 Nov 2022 11:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90A16C433C1;
	Tue,  1 Nov 2022 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667302264;
	bh=pqxhOX89QC5Zrs00R7wOL/EwEMXmbVN0sPN00O3CMRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qsberOuB/n1q4TqB8FHQy5GSWFRDIRDNnT0fRh7378IRdlkIRZsuRV3WNumSOkDBL
	 QsZhd1KRzR2vKFapX/HxH0ziz1vx7rst8kTUcvE7DF13m7Zzn3+VS2x1geg8jDXfce
	 HsxdCBs1mzJP6hffgGF0AKCY8RsGiO9RnM7u1qXBb6jrC9TyuEfMn/Xbwj+0B3xulH
	 ZC43K0U0uqApJxFw/YPWViidThQ12Z+/lW1Fw5tpZtPuvcWk/xiOo7G4gaOAd5yb2n
	 1dKqtbZC4eQI7A47lQvJ7FLUqaZ9KSqJmyk/Cn4eAanush41O3svZpr50v0tG8aDrI
	 xn+hDFFzr8S2g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	bleung@chromium.org,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH AUTOSEL 5.4 2/8] media: cros-ec-cec: limit msg.len to CEC_MAX_MSG_SIZE
Date: Tue,  1 Nov 2022 07:30:51 -0400
Message-Id: <20221101113059.800777-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221101113059.800777-1-sashal@kernel.org>
References: <20221101113059.800777-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

[ Upstream commit 2dc73b48665411a08c4e5f0f823dea8510761603 ]

I expect that the hardware will have limited this to 16, but just in
case it hasn't, check for this corner case.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/cros-ec-cec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
index 31390ce2dbf2..ae274a7aa3a9 100644
--- a/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
+++ b/drivers/media/platform/cros-ec-cec/cros-ec-cec.c
@@ -45,6 +45,8 @@ static void handle_cec_message(struct cros_ec_cec *cros_ec_cec)
 	uint8_t *cec_message = cros_ec->event_data.data.cec_message;
 	unsigned int len = cros_ec->event_size;
 
+	if (len > CEC_MAX_MSG_SIZE)
+		len = CEC_MAX_MSG_SIZE;
 	cros_ec_cec->rx_msg.len = len;
 	memcpy(cros_ec_cec->rx_msg.msg, cec_message, len);
 
-- 
2.35.1

