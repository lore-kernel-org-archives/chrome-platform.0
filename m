Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFB928E3
	for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 08:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF58C433C1;
	Fri, 18 Nov 2022 08:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668761959;
	bh=WzUAd8yRzWARHvRUpEFlJzb/3r+JeBM3q4HnpI1Omfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JxOu+a3PYskaCEGWas7w3dpvfl2zR3VnSHTQ6fQjLTe+sUTM1UYRazUbbvxNxsbj2
	 83yGWwZucT33i+W4FwqlCmsMIiKWkJHA9vCaTfwoJZ/JH6x1UcOWcHoqKusGQEE9MG
	 f19dSiKFv+9jqDqqHRUkfMIiO9WbHSCxImzp8KTUK8RIMvzhR0w50btgC1eFIrBlTh
	 4AR8nkokpJZUf/oaTK8BMDxPyQoDgiMvK2AXKmp9QO2W7v21Xrc+QBocNibu0+8aFk
	 eOYYvMvVfOBUfbABrroqPGOpYhdCVyUxP9wdVTwtkW/z82EAuRdqDpJEUvQLqJwUtu
	 7VriLmWa6xv8Q==
Date: Fri, 18 Nov 2022 08:59:13 +0000
From: Lee Jones <lee@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Mark Hasemeyer <markhas@chromium.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Raul Rangel <rrangel@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/3] dt-bindings: mfd: Add DT compatible string
 "google,cros_ec_uart"
Message-ID: <Y3dJYXCngi1p28HO@google.com>
References: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221117114818.v7.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
 <Y3cboMlFTRzSJyQ8@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y3cboMlFTRzSJyQ8@google.com>

On Fri, 18 Nov 2022, Tzung-Bi Shih wrote:

> On Thu, Nov 17, 2022 at 11:48:47AM -0700, Mark Hasemeyer wrote:
> > Add DT compatible string in
> > Documentation/devicetree/bindings/mfd/cros_ec.txt
> 
> The patch doesn't apply.  Please rebase it.

Were you actually trying to apply the patch, or just testing?

-- 
Lee Jones [李琼斯]
