Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C95EB1B
	for <chrome-platform@lists.linux.dev>; Thu,  5 Jan 2023 18:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36CDC433F0;
	Thu,  5 Jan 2023 18:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672942124;
	bh=KWeJ/Y2HrNP/kW3nju3KAeYwi+UU7Gs5Hkp4ECFzZi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g0AdBRx9jXzrCaAhxObcdUbsQHtaKw2a3A2VwKHUxmfpz7sQ5G3rQ9KCTRkWp4qwq
	 Wg83Nnz1/VbmHug1lQQcSUoP+p6u2CDqJ9Yo0cJ/vSxamyd5Trcx7i8NoW8G/6Hth8
	 b89FaYU59CgLFOJ0rA7dw4769QVr+7jMpcTI8sshDsGG0o1Y1txHqZKMk0GzuIzU7q
	 jq/wENHz0KZSVz4i4kzhcUSK/xSgSkfXT3lPwJIOKDZReEE50y6m1Fxt8wQ//vAcD/
	 I+5blsJraxyny9nVCMSw1t7Wax87KkdgWTL72IzFs4ke2D4+v15thbrt0XXQz2Qd1z
	 RVdtoibXSSZhg==
Date: Fri, 6 Jan 2023 02:08:40 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Mark Hasemeyer <markhas@chromium.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Raul Rangel <rrangel@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v10 2/3] dt-bindings: mfd: Add compatible string for UART
 support
Message-ID: <Y7cSKFIakdGKKokE@google.com>
References: <20221207104005.v10.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221207104005.v10.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
 <Y7WkeCi7/x/t37JM@google.com>
 <Y7YjmtwByTR+8tbZ@google.com>
 <Y7bdmiZ9lqKZXCfq@google.com>
 <Y7buUdgLfnQqnG+x@google.com>
 <Y7b6dC6dDNO2bVjr@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7b6dC6dDNO2bVjr@google.com>

On Thu, Jan 05, 2023 at 04:27:32PM +0000, Lee Jones wrote:
> > > You should gain permission from the maintainer before you apply patches.
> > > 
> > >   % scripts/get_maintainer.pl -f Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > >      Lee Jones <lee@kernel.org> (supporter:MULTIFUNCTION DEVICES (MFD))
> > >      Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> > >      Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> > >      Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC support)
> > 
> > I see.  I guess for the case, I should get both MFD and DT bindings
> > maintainers' Acks before applying the patch.
> 
> Yes.  The situation isn't overly clear and differs from subsystem to
> subsystem and maintainer to maintainer.  In the MFD case, Rob and
> Krzysztof conduct the first reviews.  99 times out of 100, if they're
> happy, I'm happy and I merge the changes via the MFD tree.  Same goes
> for Backlight and more recently, LEDs.

I see.  Apologize for that and I will pay more attention next time when
handling cross-subsystem patches.
