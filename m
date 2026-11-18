Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992299;
	b=ohNvUDh7xSh5KhFyiO4mEFWsuzvm7xOHS1u2DYwCXTr1sW8zZjNNYHj9Gi/mGPN6W6wK
	 VD+WtBM/aKqk1xdePj7nindCMf/b8oywCM2mBKMYLog4ijH0jVx64poHFIIlYTuwY1HFT
	 W7wkBpfXK5PXNGiLZTz3AWVTPeIguCXN5cBjjwi3mIJYDxcFmnk7oNylmQ4ZgnZwbCIib
	 10u9KITV29Ofj5WXhS7ZDBRv+FWX3BS9XN1UKh8ZUFhv24xNXub+KzdRxaG7amk4qzgo8
	 Yn4YiLCzGG/pN6gVrcoCC6iUXhmwxLeVQ7HC9b4eoEZokWU2306/vigffn2oEi6+qjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992299;
	h=DMARC-Filter:DKIM-Signature:Cc:In-Reply-To:X-Original-From:To:From:
	 Date:X-Mailer:References:Subject:Message-Id:Mime-Version:Received:
	 X-Lms-Return-Path:Content-Transfer-Encoding:Content-Type;
	bh=D3l2PQch6BsluJL94AQiUY8vO2xjRk9xx637S8ppt6s=;
	b=4Cot/U+cWG7A7URJjxLtOZw4tN+TIBhnLMcKMK2umBKEH3AD1dmJChiEJMSkhzg6Jp/9
	 my5E4zOo1e9vXfOIJOzGPcBuMwWTmoE0epPnhR966c0GBSg/evi0ox3lgIlmacQBushCI
	 GaRuWOpa3zov71Jl5vxUUUgjfit4m1QXraPy5O95fc006pWaxsrvkU5XQyhAGdTEOMn3R
	 210MwXDv6V4R2WJsxK8/Gv2Ts/ghCSt82KFEs48poyzvapE3fmjGJspI3Yq93YwMnxj+o
	 Gvk144csQhfQCC630cfFA6m2r2uWPKcB7b6S6X1oRmoKw5NV/ymoYm2TR7Sq7ccw01Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=sTyGVX8w;
	arc=none smtp.remote-ip=209.127.231.50
Received: from va-2-50.ptr.blmpb.com (va-2-50.ptr.blmpb.com [209.127.231.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D8D606A334
	for <chrome-platform@lists.linux.dev>; Wed, 18 Nov 2026 08:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00D8D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=sTyGVX8w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794992293;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=D3l2PQch6BsluJL94AQiUY8vO2xjRk9xx637S8ppt6s=;
 b=sTyGVX8wF16lZWjgjpS/ah9Xty9Q6CPwVDeTxA33OM56iM0ZT94Y+hXCmFkI8CG+a7+D9l
 EJgKX4LioXEdMLqgk/eDNctYlFpcwyqRWHWRgBhSrfVQ8cQWTIll2++6QDWvt/OIGHl6zh
 OjREZER1Wec2ixEHjJNiJb2oH+pFWxE6LSgzt79N4dn3OKME2eiiDM+RJWLYsIK7zskxzv
 ZJyiGAgTcxjWTZBSFVQ4FlHA2kp4WR3yl9B3wLSqxR9wMk8PPTx765DCMjxwgcPF4Hqufo
 p3sSSPv9zwhihfgoqzXNIoDKy9j2vfE8m9GQcndnpSlZ2xVMtuHIFnlXcSf0bA==
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Tzung-Bi Shih" <tzungbi@kernel.org>, 
	"Guenter Roeck" <groeck@chromium.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, <devicetree@vger.kernel.org>, 
	<chrome-platform@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
X-Original-From: Wang Yang <yang.wang@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, "Benson Leung" <bleung@chromium.org>
From: "Wang Yang" <yang.wang@deepcomputing.io>
Date: Wed, 18 Nov 2026 16:57:39 +0800
X-Mailer: git-send-email 2.43.0
References: <20261118085742.1817536-1-yang.wang@deepcomputing.io>
Subject: [PATCH 6/9] riscv: dts: spacemit: Add K3 eSPI pin group
Message-Id: <20261118085742.1817536-7-yang.wang@deepcomputing.io>
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Received: from ubuntu.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Wed, 18 Nov 2026 16:58:09 +0800
X-Lms-Return-Path: <lba+26afd68a2+8762b6+lists.linux.dev+yang.wang@deepcomputing.io>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

Describe the eSPI0 pin function on pads 91 through 98, including the
separate clock pull configuration. The group is only applied when a
board references it.

Prepared with Codex assistance from the existing DC-linux EC support.

Signed-off-by: Wang Yang <yang.wang@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index cb4f4f4e3..5bae382fa 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -11,6 +11,30 @@
 #define K3_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	espi0_2_cfg: espi0-2-cfg {
+		espi0-0-pins {
+			pinmux = <K3_PADCONF(91, 4)>,	/* espi0 d0 */
+				 <K3_PADCONF(92, 4)>,	/* espi0 d1 */
+				 <K3_PADCONF(93, 4)>,	/* espi0 d2 */
+				 <K3_PADCONF(94, 4)>,	/* espi0 d3 */
+				 <K3_PADCONF(95, 4)>,	/* espi0 cs */
+				 <K3_PADCONF(97, 4)>,	/* espi0 reset */
+				 <K3_PADCONF(98, 4)>;	/* espi0 alert */
+
+			bias-pull-up;			/* normal pull-up */
+			drive-strength = <25>;		/* DS8 */
+			power-source = <1800>;
+		};
+
+		espi0-1-pins {
+			pinmux = <K3_PADCONF(96, 4)>;	/* espi0 clk */
+
+			bias-pull-down;			/* normal pull-down */
+			drive-strength = <25>;		/* DS8 */
+			power-source = <1800>;
+		};
+	};
+
 	gmac0_rgmii_0_cfg: gmac0-rgmii-0-cfg {
 		gmac0-rgmii-0-pins {
 			pinmux = <K3_PADCONF(0, 1)>,	/* gmac0_rxdv */
-- 
2.43.0
