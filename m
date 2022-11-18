Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A182E443B
	for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 14:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E64C433D6;
	Fri, 18 Nov 2022 14:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668781698;
	bh=T7HfDD46P7xE4VMoR6Z9Idk9G+uS3S4T34Q+NY3qED4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvCer4rZc7rfSEwdcLtiju0mxO7RP/vXYXSCIpX+DB85cYFmQm88jOuHifqfDaeXT
	 uR1yS4xUX3W2Se6ZBRRKW5ta53DEwh/w/lSK92QssTX7cTqqP+rJo2Ybs993aCzRPO
	 +LWHhZLvse67PQyIBANHYWBSAvTk9oZRRRLWnF+6BnlmPBNlA6Br+H1JspyH1qUZeE
	 cIlKway3Xb9zabik6lO8wK2yCYx+boYTs/ylaO37cosVzzcDI5qg0Xz8/cLtN+4J7S
	 HZrgB3Hf3UyL/L3iPuW07Ui+UqzDlCgeakhqYNkRlg5sGslUi5G0KqHIxCImWIORk7
	 KL3c7Y8hld58w==
Date: Fri, 18 Nov 2022 14:28:12 +0000
From: Lee Jones <lee@kernel.org>
To: Guenter Roeck <groeck@google.com>
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
Message-ID: <Y3eWfOUdcElS9cun@google.com>
References: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221117114818.v7.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
 <CABXOdTfB9DA1LX3qj4QiHdTuJwV_OnP3eUEyTUvHzX3L3jnkNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABXOdTfB9DA1LX3qj4QiHdTuJwV_OnP3eUEyTUvHzX3L3jnkNA@mail.gmail.com>

On Fri, 18 Nov 2022, Guenter Roeck wrote:

> On Thu, Nov 17, 2022 at 10:49 AM Mark Hasemeyer <markhas@chromium.org> wrote:
> >
> > Add DT compatible string in
> > Documentation/devicetree/bindings/mfd/cros_ec.txt
> >
> 
> This is now google,cros-ec.yaml

Also there is no need to repeat the filename in the commit message.

We can see that in the diff-stat below.

Please come up with a more imaginative commit message.

Exactly what are you doing, why you're doing it will do.

> > Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
> > Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
> > ---
> >
> > Changes in v7:
> > - No change
> >
> > Changes in v6:
> > - No change
> >
> > Changes in v5:
> > - No change
> >
> > Changes in v4:
> > - Changes in commit message.
> >
> > Changes in v3:
> > - Rebased changes on google,cros-ec.yaml
> >
> > Changes in v2:
> > - No change
> >
> > ---
> >  .../devicetree/bindings/mfd/google,cros-ec.yaml       | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > index 04962bb29576e..26787e4574b8d 100644
> > --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> > @@ -28,6 +28,9 @@ properties:
> >        - description:
> >            For implementations of the EC is connected through RPMSG.
> >          const: google,cros-ec-rpmsg
> > +      - description:
> > +          For implementations of the EC is connected through UART.
> > +        const: google,cros-ec-uart
> >
> >    controller-data:
> >      description:
> > @@ -222,4 +225,12 @@ examples:
> >              compatible = "google,cros-ec-rpmsg";
> >          };
> >      };
> > +
> > +  # Example for UART
> > +  - |
> > +    uart0 {
> > +        cros-ec {
> > +            compatible = "google,cros-ec-uart";
> > +        };
> > +    };
> >  ...
> >

-- 
Lee Jones [李琼斯]
