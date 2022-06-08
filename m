Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BCE2F39
	for <chrome-platform@lists.linux.dev>; Wed,  8 Jun 2022 11:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB26C341C0;
	Wed,  8 Jun 2022 11:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654686483;
	bh=jPByg0s6gOr1IG5nl89kHVvmg5BipfwdxFF0RGN3acs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i5ZVUNYsG8FbqIVev1zST5myOazD0Q76aCA35UkOpKrYc3QVNjXK4H0dmNaY9bGfV
	 aomS/ku9QhTOBUhbdPgM4fkizvxRDg3uj7hDBKEqv4LNLl2c3GYkB11zXWYNrDHi/p
	 z5w4ZIoxJLXhv+/Si/vdYnWStxtH1lO7EAdu8vS9aMXn5OEetYY5J/K1zts0lo0WNn
	 9G9nHMAovv9zEqM6Ons/S+U+DUzbsbXlBoQm9xE/Pe8bfNXngz/128Lr+7s5K4+G57
	 bMwqhReIpjUvaJWTJYtdJ/o6Qblxi+U2cJDDnwb+QJZTi203HUnRZaH+6vVTzErSp8
	 ke3iagvJjarqg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/23] platform/chrome: cros_ec_proto: handle empty payload in getting info legacy
Date: Wed,  8 Jun 2022 11:07:23 +0000
Message-Id: <20220608110734.2928245-13-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220608110734.2928245-1-tzungbi@kernel.org>
References: <20220608110734.2928245-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cros_ec_get_proto_info_legacy() expects to receive
sizeof(struct ec_response_hello) from send_command().  The payload is
valid only if the return value is positive.

Return -EPROTO if send_command() returns 0 in
cros_ec_get_proto_info_legacy().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Changes from v2:
- Separate Kunit test to another patch.

 drivers/platform/chrome/cros_ec_proto.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 04b9704ed302..473654f50bca 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -356,7 +356,7 @@ static int cros_ec_get_proto_info_legacy(struct cros_ec_device *ec_dev)
 	struct cros_ec_command *msg;
 	struct ec_params_hello *params;
 	struct ec_response_hello *response;
-	int ret;
+	int ret, mapped;
 
 	ec_dev->proto_version = 2;
 
@@ -377,12 +377,18 @@ static int cros_ec_get_proto_info_legacy(struct cros_ec_device *ec_dev)
 		goto exit;
 	}
 
-	ret = cros_ec_map_error(msg->result);
-	if (ret) {
+	mapped = cros_ec_map_error(msg->result);
+	if (mapped) {
+		ret = mapped;
 		dev_err(ec_dev->dev, "EC responded to v2 hello with error: %d\n", msg->result);
 		goto exit;
 	}
 
+	if (ret == 0) {
+		ret = -EPROTO;
+		goto exit;
+	}
+
 	response = (struct ec_response_hello *)msg->data;
 	if (response->out_data != 0xa1b2c3d4) {
 		dev_err(ec_dev->dev,
-- 
2.36.1.255.ge46751e96f-goog

