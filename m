Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EE1210D
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jun 2022 08:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F33C36AFE;
	Thu,  9 Jun 2022 08:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654764619;
	bh=6z5racoITI8151LbBBfK7WD0SMSYCiCuN3ZDAWXqFdo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qEBarKUU02tNA4nCtEhqAT6uQAvQNV4bOl7Hg+FgGsdZwMR0FCeb/s12DbAoXedji
	 MYFbmm0jCpL5RWkt6ZpK5fBNzZ6ZaS3yDFM/NJK1kRoKhSktAg09uzM/UBYsqp6HwA
	 MZXdD8jYbyIkDFpd2vPeJRuokjOQ6ObPC4AsNeps4qlLYT/KuTyWjHSE39tcaMkoTQ
	 JktUw53s4lBM88uEcM96HnWFebzVaVt6fIWMQsujwnyMz6aS8VMxcPieSv9KSGUGJo
	 0Qd3P3Lxy3yXCrSrrXPWdZOgJc91M4R/4ZyQsYEkTM7ai1LvIkY/Zi8wYVf0SVgCmF
	 F7pK5dVjbq98A==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/21] platform/chrome: cros_ec_proto: assign buffer size from protocol info
Date: Thu,  9 Jun 2022 08:49:40 +0000
Message-Id: <20220609084957.3684698-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220609084957.3684698-1-tzungbi@kernel.org>
References: <20220609084957.3684698-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`din_size` is calculated from `ec_dev->max_response`.
`ec_dev->max_response` is further calculated from the protocol info.

To make it clear, assign `din_size` and `dout_size` from protocol info
directly.

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
No change from v2 and v3.

Changes from v1:
- Add R-b tag.

 drivers/platform/chrome/cros_ec_proto.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 65191af5139c..629dce3e6ab3 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -449,12 +449,8 @@ int cros_ec_query_all(struct cros_ec_device *ec_dev)
 			"using proto v%u\n",
 			ec_dev->proto_version);
 
-		ec_dev->din_size = ec_dev->max_response +
-			sizeof(struct ec_host_response) +
-			EC_MAX_RESPONSE_OVERHEAD;
-		ec_dev->dout_size = ec_dev->max_request +
-			sizeof(struct ec_host_request) +
-			EC_MAX_REQUEST_OVERHEAD;
+		ec_dev->din_size = proto_info->max_response_packet_size + EC_MAX_RESPONSE_OVERHEAD;
+		ec_dev->dout_size = proto_info->max_request_packet_size + EC_MAX_REQUEST_OVERHEAD;
 
 		/*
 		 * Check for PD
-- 
2.36.1.255.ge46751e96f-goog

