Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AA033ED
	for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 12:49:06 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id a29so8009475lfj.9
        for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 04:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dU64xqPho7kuHJmVoycv5RAnRsFWiiDIDLC2AX54FvU=;
        b=zWsKvLSaBpnXwQgAMArDsQN8Mh76n4rm3smY4OmvD6w1gb56smCVYkajL6+fEELXF1
         DhbTDRcwwz6YPf4F/knoGwpNIC7/05LnK60mvN5UljbFrsnSpJKm8tWdGo9HSOwzP4WY
         SBt/6LISBjRU8T0KrhGaoiextz9hiSLnEw5SNa6kPIg/UXu4wINm83xS2KwhO6bStMPq
         L++hDjGn4LyK4vKn+xqo55SQgAPIHVngp/EM7yt7BCYHTYLa8cncftRBUotVGX1QCr9L
         gCYtP+s2D9g7l48jGdXENPD7hi3aWkRkS2rg6OmTjJ1jgAz4pmTbALzIcVy3iMDBOKPS
         rfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dU64xqPho7kuHJmVoycv5RAnRsFWiiDIDLC2AX54FvU=;
        b=uaz9nNZkGT++MDb3PiG1+VpFkuNrIRnOYq678P77h48VuAwKadlcL0SGMqmLN/FVl4
         n/KaQ/1bOA0U6bLFdvjudv2UyhDFqhOS2X1I3sIhuWPid1BrEwPj5jjbUtdYAyjZ/IOT
         cVJ7wMaGeCvZpTYBbIxsNa8lYgf/Q7Fg3xadtJq3sgqYzYe1g1NLpL5wjqHmRms0stKX
         k3YkbrSZgdw/BAfe4q+H00gpLJCGWJ6RNwxik7qtNDGZdA+v2ySsxnlZTasNuv1eNTvt
         HbGnho27yTnvWZOMhE5IG+pvIBeXZtT8f/A55booLDXJHnf5wg6irRYe6/ua4TpN8QCF
         7mNw==
X-Gm-Message-State: ANoB5pl9BbgTmzwSuR9qD1jD9eoE6w0jECiywPJdCUG2zWrzD6RQARbp
	cTB4NEHuxv2O7s8/pdiri/DjZg==
X-Google-Smtp-Source: AA0mqf4S45tv+uFGzNLO8iegiUq98o9vBtYfGX9TTNzxiVINlyIkdnSCI4SWatImnxWio6dy1IvG2w==
X-Received: by 2002:ac2:539c:0:b0:4a9:d072:f5c4 with SMTP id g28-20020ac2539c000000b004a9d072f5c4mr2397956lfh.82.1668775744922;
        Fri, 18 Nov 2022 04:49:04 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id j23-20020ac253b7000000b004a62ff61b3dsm645708lfh.252.2022.11.18.04.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 04:49:04 -0800 (PST)
Message-ID: <568d377d-8225-0079-b0a5-83ba4ec42f66@linaro.org>
Date: Fri, 18 Nov 2022 13:49:03 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 2/3] dt-bindings: mfd: Add DT compatible string
 "google,cros_ec_uart"
Content-Language: en-US
To: Mark Hasemeyer <markhas@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Raul Rangel <rrangel@chromium.org>,
 Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org
References: <20221117114818.v7.1.If7926fcbad397bc6990dd725690229bed403948c@changeid>
 <20221117114818.v7.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117114818.v7.2.I9e018ecb8bdf341648cb64417085978ff0d22a46@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/11/2022 19:48, Mark Hasemeyer wrote:
> Add DT compatible string in
> Documentation/devicetree/bindings/mfd/cros_ec.txt

As pointed this is not valid path anymore.

Subject: Drop second, redundant "DT" word.

With both fixed:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

