Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8B4186D
	for <chrome-platform@lists.linux.dev>; Mon, 24 Jul 2023 08:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D27C433C9;
	Mon, 24 Jul 2023 08:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690186399;
	bh=yIRFPq4WWmrZW4jnPsriDA/saM3iFdI+aGlRcboj/x0=;
	h=From:To:Cc:Subject:Date:From;
	b=See/KlwYNUoSId3w+MFdhD2dYE/0ISTZq0iNAA4Xp3/2PMiNOYBMlMjHtFlliBphW
	 dwogfqhnB25SWyrtXzP9y5tn1JENFd+UJQ8Rg2EXsyvv7iKcLStUp6dAA6Eph7hpue
	 B8FpcLERXFIItTqXZqV8L0hac8SPr8ww82GhfNyLMl8NwuiZkmtH+EZRD0AFbDke05
	 MHaSn8Zs3RrYPJrb0Jk2m8cNJ3JcMcWezBqpUo6ovhHWf32atCnaP65P0faTN9Kr+B
	 BYF0MX9v00ORbWL6YLaUMN9LDLSbNVDP0GYl3EuYmAcJlJGiWd9aS5J65DKkAoWhuT
	 cf4gTJMHF/kZA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: gregkh@linuxfoundation.org,
	chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	jwerner@chromium.org,
	swboyd@chromium.org,
	briannorris@chromium.org,
	dianders@chromium.org,
	sjg@chromium.org,
	dossym@chromium.org
Subject: [PATCH v2] MAINTAINERS: Add drivers/firmware/google/ entry
Date: Mon, 24 Jul 2023 16:12:47 +0800
Message-ID: <20230724081247.678784-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brian Norris <briannorris@chromium.org>

These are mostly used for Chrome platforms, so group it in with the same
mailing list, repo, and (one) committer.

Signed-off-by: Brian Norris <briannorris@chromium.org>
Acked-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
This is a revival for v1[1] as it is few-months-old.

Planning to let chrome-platform-firmware use:
- "for-firmware-kernelci" branch for KernelCI[2].
- "for-firmware-next" branch for both 0-day[3] and linux-next.  Patches can
  rebase onto the branch if they are aiming to chrome-platform-firmware.

Haven't figured out how to make it in linux-next specific files though
(e.g. [4]).

[1]: https://patchwork.kernel.org/project/chrome-platform/patch/20221021172624.1.I119456791d197eb7d159f09e7479d8759008a954@changeid/
[2]: https://github.com/kernelci/kernelci-core/pull/2028
[3]: https://github.com/intel/lkp-tests/pull/312
[4]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=4d2c646ac07cf4a35ef1c4a935a1a4fd6c6b1a36

Changes from v1:
- Update Tzung-Bi's email address.

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3be1bdfe8ecc..8293a4ab82d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8758,6 +8758,15 @@ S:	Supported
 F:	Documentation/networking/device_drivers/ethernet/google/gve.rst
 F:	drivers/net/ethernet/google
 
+GOOGLE FIRMWARE DRIVERS
+M:	Tzung-Bi Shih <tzungbi@kernel.org>
+R:	Brian Norris <briannorris@chromium.org>
+R:	Julius Werner <jwerner@chromium.org>
+L:	chrome-platform@lists.linux.dev
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git
+F:	drivers/firmware/google/
+
 GPD POCKET FAN DRIVER
 M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.41.0.487.g6d72f3e995-goog

