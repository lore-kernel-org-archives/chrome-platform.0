Received: from sender4-pp-o98.zoho.com (sender4-pp-o98.zoho.com [136.143.188.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E4915A864
	for <chrome-platform@lists.linux.dev>; Sun,  8 Feb 2026 10:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770544870; cv=pass; b=l03+/7OJcENSel72fhQAOQAqUcw3KvKLvobo9Yptbyb+qYgQ0d9UJANCzuBv2xkMssH52a1k/fa/x2kTMOHXLN9TEoNT5GkWAqWGi7DTB0UewbEAiQiQyI59lPuQGwArk+j8T0W+SZ7u0JHXm9jDf2GIYVPpTlfPnt27YlYk910=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770544870; c=relaxed/simple;
	bh=aYa3ygV+gKF5t5+MbLNxRSxIA+s/TeUk+oAP/BA4jC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g0+vtDrd7FTeCBw6ojBOwAA/cYxTKAFRYZ3eqjTQP01MGX5RW3QT0iXHW2Z1Q1EMvk7QrF3+hT7o1Jwdc0fxCj9SaCkXJmxdnukBUpshR3Xf6Rl2x1OavuZkRoErFJgsUzVdKlRo+wW5xFgwcI0K6Ig4EemPVGJOYV7GBOb9bsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=trunixcodes@zohomail.com header.b=LnZUPdvv; arc=pass smtp.client-ip=136.143.188.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=trunixcodes@zohomail.com header.b="LnZUPdvv"
ARC-Seal: i=1; a=rsa-sha256; t=1770544867; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XDYNGGyX0rSo0cqodPS6P9mP488kamrRNoytlAKHJyhW5IeNEVeIWmQgPY7ws8GkQVa4QK2Dj1ze6m3AtKRdS1vWHB839alk9sBsPklq6Ey82TZ9jPBjgZitzS/hNg0HizOfRfAEcZWmxgRvVUgYWTJomGhoRCpOqLQmA6YpFeM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770544867; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rJ3SxVXTcIYFh1Y3XV7/IlX+YGPpH5Q5svecdfjxvDg=; 
	b=jdXx9nrACg70E3VvQQ8UTavQkfcWPHU/q9FTR/k5aXCjJHMkwNwcUvMs1mcF9rcl8XNFOHfFwcf94uqxLHI7eqF6Z4t0wV6nfO89zfDdtt+tp2qQ950vv11e0TnorL8wkJeTkXioY4xz/QtcKc4eyCAdLF076O7GFL3LYX6J4XY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=trunixcodes@zohomail.com;
	dmarc=pass header.from=<trunixcodes@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770544867;
	s=zm2022; d=zohomail.com; i=trunixcodes@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=rJ3SxVXTcIYFh1Y3XV7/IlX+YGPpH5Q5svecdfjxvDg=;
	b=LnZUPdvvD2gqk8TDE1vR23X7Ubi4yjtlSqu01DKe8WIaX5tNvjD3VTXTTAl3KPyb
	HqxsqwBQt3qlQ7LOGkt2a+5kdy/QE+/xklmUFdKACZhRzqfMPSYPiKeAkWjsQiqnesl
	5LLyynu/eCbESO8l0KMCSWU+DcqBDrfuWIA2xTSs=
Received: by mx.zohomail.com with SMTPS id 1770544865797603.3420520671159;
	Sun, 8 Feb 2026 02:01:05 -0800 (PST)
From: trunix-creator <trunixcodes@zohomail.com>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	trunix-creator <trunixcodes@zohomail.com>
Subject: [PATCH] platform/chrome: cros_ec_lightbar: fix const correctness of seqname array
Date: Sun,  8 Feb 2026 02:00:49 -0800
Message-ID: <20260208100049.46449-1-trunixcodes@zohomail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227ba644a18692ccbecc9353b74000050dfc538c76b39b6b89e642e4e1cbd2727bcce1cebaf3cc35c:zu08011227462f611a3630a3de53c4abf200008b73b9fcd6eee2687042e16695238c99b454b4acb4a561ede0:rf08011226f15438ad667549bf40e7a16a0000520a7a7477cde10b8057a64d70c56f6624f8ee1561a90e74:ZohoMail
X-ZohoMailClient: External

The seqname array was declared as 'char const *seqname[]',
And since the array is intended to be fully immutable, It is now corrected
to 'const char * const seqname[]' to mark both the strings and the pointer array as read-only.

This improves const correctness and matches the intended usage of the
sequence name table.

Signed-off-by: trunix-creator <trunixcodes@zohomail.com>
---
 drivers/platform/chrome/cros_ec_lightbar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/chrome/cros_ec_lightbar.c b/drivers/platform/chrome/cros_ec_lightbar.c
index 8352e9732791..922758c2cec1 100644
--- a/drivers/platform/chrome/cros_ec_lightbar.c
+++ b/drivers/platform/chrome/cros_ec_lightbar.c
@@ -283,7 +283,7 @@ static ssize_t led_rgb_store(struct device *dev, struct device_attribute *attr,
 	return (ok && i == 0) ? count : -EINVAL;
 }
 
-static char const *seqname[] = {
+static const char * const seqname[] = {
 	"ERROR", "S5", "S3", "S0", "S5S3", "S3S0",
 	"S0S3", "S3S5", "STOP", "RUN", "KONAMI",
 	"TAP", "PROGRAM",
-- 
2.43.0

