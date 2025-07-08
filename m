Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C69B21771B
	for <chrome-platform@lists.linux.dev>; Tue,  8 Jul 2025 08:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961769; cv=none; b=AFRU6S7DlN/f/24tN51HlEAUpf/zKh+/Wcn/bQDh8TJa/bu7zJ60EMVCYwtPWQIHEULxi7GuGiTUz+NIT+tFki51VvDtqUvY/OnY+bS5k/OIQy6O6F0+Kg066ezIrzLHFwter3oAiP3Pv4Wnwf0C/JTehJYMzQ++Rkz78KjVuYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961769; c=relaxed/simple;
	bh=ruvONBc+RxzVyAfWHH18+/qD7nAx9EAK0CAC/ts9wvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6LSyvDrDzc4lfXYm2GZ47vMEm/JNTRlRssBo4wR2S91pTg848g6Ye0lAzByyjxDBOzzgRIOxWPN1b08WF2G11VuXdIXYZGtKE/JPblsGF3zXeNTbvfhULtX8kB1T3ZZUmlwZo+Ooxqkk0n5L91NZYO0+7ww30cmoAVvjrgFQlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBzb3EUL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBzb3EUL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F808C4CEED;
	Tue,  8 Jul 2025 08:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751961769;
	bh=ruvONBc+RxzVyAfWHH18+/qD7nAx9EAK0CAC/ts9wvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bBzb3EULWVd7Rb1HBS6mtrBBCtB9LXtX5IVcI/vN/d5DGX1RuzEBfhnktRMspz10t
	 qT8LDbJA1q85hiE5rnqAgU7esb3jQWf1MnSJqM7qhDmy8Y08GTXbuIp+tNT9obngKD
	 ZPPjTyl2GeMnhAkyTMvmb+SFwC5dYjRX1MPexCVmFiJdKCvLOfHQp6CKwL/OYHPul5
	 QozZVegGKq0ZiUIIhMsKIYIt8KI3ySC8c29H4HdyIf5+m2+9n2sTbJAcGbfQrcdFJ8
	 V+kySWx5fq0D7yuIcsIt0Hzq4MvDI1ePb9zRiGrgAZt91SONk4dBRskcHF/eBbEZNO
	 SU9qLBTS7yUcg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	dawidn@google.com,
	gregkh@linuxfoundation.org
Subject: [PATCH v2 5/6] platform/chrome: cros_ec_chardev: Hold refcount of struct cros_ec_device
Date: Tue,  8 Jul 2025 08:00:33 +0000
Message-ID: <20250708080034.3425427-6-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250708080034.3425427-1-tzungbi@kernel.org>
References: <20250708080034.3425427-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hold refcount of struct cros_ec_device to prevent the memory from
releasing when the fops still depend on it.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
New patch in the v2 series.

 drivers/platform/chrome/cros_ec_chardev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_chardev.c b/drivers/platform/chrome/cros_ec_chardev.c
index c9d80ad5b57e..1cb09ca3b850 100644
--- a/drivers/platform/chrome/cros_ec_chardev.c
+++ b/drivers/platform/chrome/cros_ec_chardev.c
@@ -181,6 +181,7 @@ static int cros_ec_chardev_open(struct inode *inode, struct file *filp)
 		kfree(priv);
 	}
 
+	cros_ec_device_get(ec_dev);
 	return ret;
 }
 
@@ -256,6 +257,7 @@ static int cros_ec_chardev_release(struct inode *inode, struct file *filp)
 
 	blocking_notifier_chain_unregister(&ec_dev->event_notifier,
 					   &priv->notifier);
+	cros_ec_device_put(ec_dev);
 
 	list_for_each_entry_safe(event, e, &priv->events, node) {
 		list_del(&event->node);
-- 
2.50.0.727.gbf7dc18ff4-goog

