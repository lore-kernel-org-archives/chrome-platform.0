Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D56A156EE
	for <chrome-platform@lists.linux.dev>; Thu,  3 Aug 2023 10:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E936FC433C7;
	Thu,  3 Aug 2023 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691057339;
	bh=FtMPU2QFp0BlSTfk3VxfW7RHfjEIr9HTHNB59UbJ+is=;
	h=From:To:Cc:Subject:Date:From;
	b=IAhEN48yA2yC9klrxS/BM8hIaEevRMKzA/XuI9tj5AMv9AodvxEi/aI8ZEX1QinFK
	 sRexOjw+oVw140hFIlRT9pwbgjSqkWhcsKkWEG6OpJsq4vg1bdDHUBrLEA+7tNIxLB
	 DgquX0barMSXLwJq2mfQMGvtZXQ1RsZ4OjM7iGJDojpuECAXzsxY+YlcdhvRQ01OC4
	 Ct4vEoNpWoqUGF1RkFbHK9Um/5m5QlBCsHcQrVRoMmaLzbf8tDZTahR4pecVQGHuj2
	 /kuOgqtnOxgC10O00nzFuWUD6eAwcy2qlg91XCoby3G7rROqkxn6ZZL/QNJcg5ozsw
	 +d6MgY85+MvkA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org
Subject: [PATCH] MAINTAINERS: update maintainers of chrome-platform
Date: Thu,  3 Aug 2023 18:08:46 +0800
Message-ID: <20230803100846.3223564-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Tzung-Bi as a maintainer of chrome-platform.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3be1bdfe8ecc..76299dc9a04c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4812,6 +4812,7 @@ F:	drivers/input/touchscreen/chipone_icn8505.c
 
 CHROME HARDWARE PLATFORM SUPPORT
 M:	Benson Leung <bleung@chromium.org>
+M:	Tzung-Bi Shih <tzungbi@kernel.org>
 L:	chrome-platform@lists.linux.dev
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
-- 
2.41.0.585.gd2178a4bd4-goog

