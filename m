Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F6120F4
	for <chrome-platform@lists.linux.dev>; Fri, 13 May 2022 04:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF92C34117;
	Fri, 13 May 2022 04:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652416919;
	bh=Ru+rS0IQ9IXfMCF8DmORHI1hv6atGBSVQdZH07gCx3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OXLthW4Gp78VNUfhLwiDz4XQ64QoA4Bl0y2nrLm8xMrjnwDaEtbfbGISUwTX/q/hP
	 wh8VNE6O0GJSAARifhoSoajCKj99GZo0K57Ecc/LoylQhcbjOxCOdYgcnVjzI6ehbI
	 PgyKjMF5VQtku0uF0YLVKoJ8YPqKe0KlmIwN9/H8bOJUyzBz1EKN+sUlSTuzxNU6wm
	 L7Emk4+IFI6gxvh3zQpTLhFgnPTqfKyno+a3NvG5LkbxU8ACD2PUtfApEMNMggOQt9
	 t5RbtBt/KrqnXVX1I1nKEKNDmnOY0Ct6CL8hnty2dEGF7LFBfzWP2fhcxdLkNGo2ZA
	 tYtj11cJny2/Q==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] platform/chrome: cros_ec_i2c: drop BUG_ON() in cros_ec_pkt_xfer_i2c()
Date: Fri, 13 May 2022 12:41:41 +0800
Message-Id: <20220513044143.1045728-6-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513044143.1045728-1-tzungbi@kernel.org>
References: <20220513044143.1045728-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is overkill to crash the kernel if the given message is oversize.

Drop the BUG_ON() and return -EINVAL instead.

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v1:
- Add R-b tag.

 drivers/platform/chrome/cros_ec_i2c.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_i2c.c b/drivers/platform/chrome/cros_ec_i2c.c
index a4f305f1eb0e..9f5b95763173 100644
--- a/drivers/platform/chrome/cros_ec_i2c.c
+++ b/drivers/platform/chrome/cros_ec_i2c.c
@@ -72,13 +72,19 @@ static int cros_ec_pkt_xfer_i2c(struct cros_ec_device *ec_dev,
 	i2c_msg[1].flags = I2C_M_RD;
 
 	packet_len = msg->insize + response_header_size;
-	BUG_ON(packet_len > ec_dev->din_size);
+	if (packet_len > ec_dev->din_size) {
+		ret = -EINVAL;
+		goto done;
+	}
 	in_buf = ec_dev->din;
 	i2c_msg[1].len = packet_len;
 	i2c_msg[1].buf = (char *) in_buf;
 
 	packet_len = msg->outsize + request_header_size;
-	BUG_ON(packet_len > ec_dev->dout_size);
+	if (packet_len > ec_dev->dout_size) {
+		ret = -EINVAL;
+		goto done;
+	}
 	out_buf = ec_dev->dout;
 	i2c_msg[0].len = packet_len;
 	i2c_msg[0].buf = (char *) out_buf;
-- 
2.36.0.550.gb090851708-goog

