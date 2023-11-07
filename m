Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9646F2E403
	for <chrome-platform@lists.linux.dev>; Tue,  7 Nov 2023 12:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9bD5zFM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D2ADC433C9;
	Tue,  7 Nov 2023 12:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699359043;
	bh=MtEg56Db1ITpZqsJ9sWS9PdSnPZ0PiHqxkymMm27JNQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G9bD5zFMyd+vGdmzOX57/wy8n+pmP925cgd7G8V8ueNN0gtMqrKfb09iDcHSgWMNV
	 gOQzT2M9WmQFuS3Q8PPrMNGDQ4w4SgcizqH44wbMWKOlunz0dYYjefwQtEVwieBLjg
	 x6dQV84ce4R92nelHcYvhiSNrNp6Hqov77QkrygaIYjmeh4rTueN7xAUxMmIDGaRSV
	 UXWLR7MtXba1inE65KFr7PhVA58mJELQE4dytX03lvD8VuUYqKI1PKu+twxCbciyN2
	 kw10CPuZqofF2vDCjPixPYJl9KcGhNeFiPIZYvFRPVPxo3h1d8A81fkiAbntcx0DC4
	 tkQF7Ztzx5ISg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Sasha Levin <sashal@kernel.org>,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH AUTOSEL 6.5 28/30] platform/chrome: kunit: initialize lock for fake ec_dev
Date: Tue,  7 Nov 2023 07:08:43 -0500
Message-ID: <20231107120922.3757126-28-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107120922.3757126-1-sashal@kernel.org>
References: <20231107120922.3757126-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
Content-Transfer-Encoding: 8bit

From: Tzung-Bi Shih <tzungbi@kernel.org>

[ Upstream commit e410b4ade83d06a046f6e32b5085997502ba0559 ]

cros_ec_cmd_xfer() uses ec_dev->lock.  Initialize it.

Otherwise, dmesg shows the following:
> DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> ...
> Call Trace:
>  ? __mutex_lock
>  ? __warn
>  ? __mutex_lock
>  ...
>  ? cros_ec_cmd_xfer

Reviewed-by: Guenter Roeck <groeck@chromium.org>
Link: https://lore.kernel.org/r/20231003080504.4011337-1-tzungbi@kernel.org
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/chrome/cros_ec_proto_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_proto_test.c b/drivers/platform/chrome/cros_ec_proto_test.c
index 5b9748e0463bc..63e38671e95a6 100644
--- a/drivers/platform/chrome/cros_ec_proto_test.c
+++ b/drivers/platform/chrome/cros_ec_proto_test.c
@@ -2668,6 +2668,7 @@ static int cros_ec_proto_test_init(struct kunit *test)
 	ec_dev->dev->release = cros_ec_proto_test_release;
 	ec_dev->cmd_xfer = cros_kunit_ec_xfer_mock;
 	ec_dev->pkt_xfer = cros_kunit_ec_xfer_mock;
+	mutex_init(&ec_dev->lock);
 
 	priv->msg = (struct cros_ec_command *)priv->_msg;
 
-- 
2.42.0

