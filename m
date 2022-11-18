Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4D528E3
	for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 09:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84299C433C1;
	Fri, 18 Nov 2022 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668763163;
	bh=iRaJEbJLZoILd9LHKyMewBZAVelq+rNxVl7UK4aOIwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HwMkO7sabolcvoNCP3zcYsgba+R/9E3t4ht5gH6Yn5JzJ9Nfx73AGedjH2F7Yt23l
	 ri8FUxYV6fflLiUAvPSn2yneJQBNiUpDAXNcaYEiLsZejWGU6lQKgr3BuKbCyKhYUt
	 0lFv7P2cRRJxewbrHwPETJvXhjcf6u4DoC6yHaaOTsOx8bykj4UkEoh88nyeU9MrHP
	 Pu96WwLgH66LP7BI8CrkHhcOW7iDiAiX9nk6oMJlR7Zt9J0lqzDUhLfu4SLtSjnzvb
	 CWFh+E0UI02lLZeR79sAjD/fNNXbxna2Wpf0T2fMzoFsSAjTMeroTkhRy+llHkMPKB
	 54cZ4X6CPGDGA==
Date: Fri, 18 Nov 2022 17:19:19 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Lee Jones <lee@kernel.org>
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
Message-ID: <Y3dOF3IQ/S5NCnR+@google.com>
References: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221117114818.v7.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
 <Y3cboMlFTRzSJyQ8@google.com>
 <Y3dJYXCngi1p28HO@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3dJYXCngi1p28HO@google.com>

On Fri, Nov 18, 2022 at 08:59:13AM +0000, Lee Jones wrote:
> On Fri, 18 Nov 2022, Tzung-Bi Shih wrote:
> 
> > On Thu, Nov 17, 2022 at 11:48:47AM -0700, Mark Hasemeyer wrote:
> > > Add DT compatible string in
> > > Documentation/devicetree/bindings/mfd/cros_ec.txt
> > 
> > The patch doesn't apply.  Please rebase it.
> 
> Were you actually trying to apply the patch, or just testing?

Was trying to apply the patch to my local Linux tree (for-next) for
reading the series.
